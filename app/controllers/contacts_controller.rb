class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Message envoyé !"
    else
      render "contacts/index", status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :surname, :company, :job, :message)
  end
end
