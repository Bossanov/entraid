class MessagesController < ApplicationController
  def new
    @message = Message.new
    @profile = current_user.profile
  end

  def create
    @message = Message.new(message_params)
    @profile = current_user.profile
    @message.profile = @profile
    @message.statut = "yes"

    if @message.save
      flash[:notice] = 'Votre message a été envoyé !'
      redirect_to root_path

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :theme, :content, :statut)

  end
end
