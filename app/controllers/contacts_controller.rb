class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

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

  def destroy
    @contact = Contact.find(params[:contactid])
    @contact.destroy
    redirect_to pages_admin_path

  end

  def effacer_contact
    @contatc = Contact.find(params[:contactid])
    @contatc.destroy
    redirect_to pages_admin_path
  end
  private

  def contact_params
    params.require(:contact).permit(:email, :content)
  end
end
