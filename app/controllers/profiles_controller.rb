class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
    @articles = Article.where(profile_id: @profile.id, statut: 'yes')
    @messages = Message.where(profile_id: @profile.id, statut: 'yes')
  end

  def index
    @profiles = Profile.where(statut: "yes")
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.statut = "no"
    if @profile.save
      flash[:notice] = 'Votre profil a correctement été créé. Il sera validé par un admin, merci.'
      redirect_to root_path
    else
      flash[:notice] = 'Un problème est survenu lors de la création de votre profil.'
      redirect_to new_profile_path
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:notice] = 'Votre profil a correctement été actualisé. Merci.'
      redirect_to profile_path(@profile)
    else
      flash[:notice] = 'Un problème est survenu lors de la mise à jour de votre profil.'
      redirect_to profile_path(@profile)
    end
  end

 def valider_profile
    @profile = Profile.find(params[:profileid])
    @profile.statut = "yes"
    @profile.save
    flash[:notice] = "Le profil a été validé. Merci."
    redirect_to pages_admin_path
  end

  def refuser_profile
    @profile = Profile.find(params[:profileid])
    @user = User.where(id: @profile.user_id)
    @user.last.destroy
    flash[:alert] = "Le profil a été refusé et effacé de la base de donnée."
    redirect_to pages_admin_path
  end

  def bloquer_profile
    @profile = Profile.find(params[:profileid])
    @profile.statut = "bloqué"
    @profile.save
    flash[:notice] = "Le profil a été bloqué. Merci."
    redirect_to profiles_path
  end

  def supprimer_profile
    @profile = Profile.find(params[:profileid])
    @user = User.find(@profile.user_id)
    @user.destroy
    flash[:alert] = "Le profil a été effacé de la base de donnée ainsi que son contenu."
    redirect_to profiles_path
  end

  def debloquer_profile
    @profile = Profile.find(params[:profileid])
    @profile.statut = "yes"
    @profile.save
    flash[:notice] = "Le profil a été débloqué. Merci."
    redirect_to profiles_path
  end

  def rendre_admin

    @profile = Profile.find(params[:profileid])
    @profile.admin = "yes"
    @profile.save
    flash[:notice] = "Le profil a mis en admin. Merci."
    redirect_to profiles_path

  end

  def rendre_nonadmin

    @profile = Profile.find(params[:profileid])
    @profile.admin = "no"
    @profile.save
    flash[:notice] = "Le profil a mis en admin. Merci."
    redirect_to profiles_path

  end

  private

  def profile_params
  params.require(:profile).permit(:first_name, :last_name, :job, :city, :phone_number, :birthday, :photo, :photo_cache, :statut, :pseudo, :biography)
  end
end
