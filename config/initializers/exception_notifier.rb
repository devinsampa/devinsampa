sender_address = %("Exception Notification" <devinsampa@gmail.com>)

exception_recipients = %w(
	tinorj+devisampa@gmail.com 
	lfcipriani+devinsampa@gmail.com 
	nuxlli+devinsampa@gmail.com 
	devinsampa+error@gmail.com
)

Devinsampa::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[devinsampa-exception] ",
    :sender_address => sender_address,
    :exception_recipients => exception_recipients

