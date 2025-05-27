class ContactsController < ApplicationController
  before_action :require_login, only: %i[new, create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path, success: 'お問い合わせ内容を送信しました'
    else
      render :new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :content)
    end
end
