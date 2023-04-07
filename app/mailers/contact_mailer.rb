class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(to: 'polska321151@gmail.com', subject: 'New Contact Form Submission')
      end
      
  end
  