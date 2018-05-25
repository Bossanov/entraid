class ContactsController < ApplicationController
  def new
    @contact = Contact.new

  end


  def create
    @contact = Contact.new(contact_params)



    if @contact.save
      flash[:notice] = 'Votre demande a été envoyée, merci !'
      redirect_to root_path

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :content)
  end
end
