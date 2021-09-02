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
      if @current_user.email == @conversation.autor
        UserMailer.notificationcommit(@conversation.dest).deliver_now
        @notification = Notification.new
        @auteuruser = User.where(email: @conversation.autor)
        @auteur = Profile.where(user_id: @auteuruser.last.id)
        @destinataireuser = User.where(email: @conversation.dest)
        @destinataire = Profile.where(user_id: @destinataireuser.last.id)
        @notification.autor = @auteuruser.last.email
        @notification.dest = @destinataireuser.last.email
        @notification.content =  @auteuruser.last.profile.first_name + " vous a répondu."
        @notification.save
      else
        UserMailer.notificationcommit(@conversation.autor).deliver_now
        @notification = Notification.new
        @auteuruser = User.where(email: @conversation.dest)
        @auteur = Profile.where(user_id: @auteuruser.last.id)
        @destinataireuser = User.where(email: @conversation.autor)
        @destinataire = Profile.where(user_id: @destinataireuser.last.id)
        @notification.autor = @auteuruser.last.email
        @notification.dest = @destinataireuser.last.email
        @notification.content = @auteuruser.last.profile.first_name + " vous a répondu."
        @notification.save
      end
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
