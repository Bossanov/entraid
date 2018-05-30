class ConversationcommitsController < ApplicationController
  def new
    @conversationcommit = Conversationcommit.new
    @conversation = Message.find(params[:conversation_id])

  end

  def create
    @conversationcommit = Conversationcommit.new(conversation_params)
    @conversation = Conversation.find(params[:conversation_id])
    @conversationcommit.conversation = @conversation
    @conversationcommit.autor = current_user.email

    if @conversationcommit.save
      flash[:notice] = 'Votre message a été posté !'
      redirect_to conversation_path(@conversation.id)

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def conversation_params
    params.require(:conversationcommit).permit(:content)

  end
end
