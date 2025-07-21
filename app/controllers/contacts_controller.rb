class ContactsController < ApplicationController
  skip_analytics only: [:create, :update, :destroy]
  allow_unauthenticated_access

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.new = true
    if @contact.save
      redirect_to contacts_path, notice: t('contacts.form.alert')
    else
      render "contacts/index", status: :unprocessable_entity
    end
  end

  def update
    Contact.find(params[:id]).update(new: false)
    redirect_to admin_path, notice: t('contacts.viewed')
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to admin_path, notice: t('contacts.destroy')
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :surname, :email, :new, :company, :job, :message)
  end
end
