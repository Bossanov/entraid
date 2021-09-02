class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.new(dest: params[:dest])
    @userdestinataire = User.where(email: params[:dest])
    @destinataire = Profile.where(user_id: @userdestinataire.last.id)
    @profile = current_user.profile
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversations = Conversation.all
    @profileautor = Profile.find(@conversation.profile_id)
    @userdest = User.where(email: @conversation.dest)
    @profiledest = Profile.where(user_id: @userdest.last.id)
    @conversationcommits = Conversationcommit.where(conversation_id: @conversation.id)
  end

  def index
    @conversations = Conversation.all
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @profile = current_user.profile
    @conversation.profile = @profile
    @conversation.autor = current_user.email

    if @conversation.save
      flash[:notice] = 'Votre message a été transmis !'
      UserMailer.notification(@conversation).deliver_now

      @notification = Notification.new
      @notification.content = "Vous avez reçu un message dans votre messagerie privée venant de " + @profile.first_name
      @notification.autor = @conversation.autor
      @notification.dest = @conversation.dest
      @notification.save


      redirect_to conversations_path
    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def supprimer_conversation
    @conversation = Conversation.find(params[:conversationid])
    @conversation.destroy
    flash[:alert] = "La conversation a été effacée de la base de donnée."
    redirect_to conversations_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:content, :autor, :dest)
  end
end
