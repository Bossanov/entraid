class MessagecommitsController < ApplicationController

  def new
    @messagecommit = Messagecommit.new
    @message = Message.find(params[:message_id])

  end

  def create
    @messagecommit = Messagecommit.new(message_params)
    @message = Message.find(params[:message_id])
    @messagecommit.message = @message
    @messagecommit.statut = "yes"
    @messagecommit.autor = current_user.email


    if @messagecommit.save
      flash[:notice] = 'Votre message a été posté !'
      redirect_to message_path(@message.id)

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def message_params
    params.require(:messagecommit).permit(:title, :autor, :content, :statut)

  end
end
