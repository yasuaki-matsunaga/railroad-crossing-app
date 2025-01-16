class ContactMailer < ApplicationMailer
  default from: 'from@example.com'

  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, bcc: "from@example.com", subject: "お問い合わせについて【自動送信】"
  end
end
