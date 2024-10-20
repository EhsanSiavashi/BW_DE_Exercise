import pyodbc 
import os 
from sqlalchemy import create_engine 
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


# Specify the directory path
directory_path = os.environ.get("directory_path")
archive_dir = os.environ.get("archive_dir")

def sql_server_connection():
    try:
        server = os.environ.get("sqlserver_name")
        db = os.environ.get("sqlserver_db")
        connection_str = f'mssql+pyodbc://@{server}/{db}?trusted_connection=yes&driver=ODBC+Driver+17+for+SQL+Server'
        engine = create_engine(connection_str)
        return engine.connect()
    except Exception as e:
        print(f"sql_server connection failed with error: {e}")


def send_email( subject, body, cc_recipients=None, bcc_recipients=None, attachment_paths=None, sender_email='emailsender@corp.com', recipient_email='emailrecipient@corp.com'):
    """
    Sends an email using SMTP.
    Args:
        sender_email (str): The sender's email address.
        recipient_email (str): The recipient's email address.
        subject (str): The email subject.
        body (str): The email body.
        cc_recipients (list[str], optional): A list of CC recipients.
        bcc_recipients (list[str], optional): A list of BCC recipients.
        attachment_paths (list[str], optional): A list of paths to attachments.

    Raises:
        smtplib.SMTPException: If there's an error sending the email.
    """

    # Create a MIME multipart message
    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = recipient_email
    msg['Subject'] = subject

    # Add CC and BCC recipients if provided
    if cc_recipients:
        msg['Cc'] = ', '.join(cc_recipients)
    if bcc_recipients:
        msg['Bcc'] = ', '.join(bcc_recipients)

    # Add the email body as a plain text part
    msg.attach(MIMEText(body, 'plain'))

    # Add attachments if provided
    if attachment_paths:
        for attachment_path in attachment_paths:
            with open(attachment_path, 'rb') as f:
                attachment = MIMEText(f.read(), 'base64', 'utf-8')
                attachment['Content-Disposition'] = f'attachment; filename="{os.path.basename(attachment_path)}"'
                msg.attach(attachment)

    # Connect to your SMTP server
    with smtplib.SMTP(host='smtp.gmail.com', port=587) as smtp:
        smtp.starttls()  # Enable TLS for security
        smtp.login('your_email_address', 'your_email_password')  # Replace with your credentials
        smtp.sendmail(sender_email, [recipient_email] + cc_recipients + bcc_recipients, msg.as_string())