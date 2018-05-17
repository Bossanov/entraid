class MessagecommitsController < ApplicationController
  def new
    @messagecommit = Messagecommit.new
    @message = Message.find(params[:message_id])

  end

  def create
    @messagecommit = Messagecommit.new(message_params)
    @message = Message.find(params[:message_id])
    @messagecommit.message = @message
    @message.statut = "yes"

    if @message.save
      flash[:notice] = 'Votre message a été posté !'
      redirect_to root_path

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def message_params
    params.require(:messagecommit).permit(:title, :theme, :content, :statut)

  end
end
