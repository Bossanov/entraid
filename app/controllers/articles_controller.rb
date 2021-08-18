class ArticlesController < ApplicationController

  def index
    @articles =Article.where(statut: "yes")
  end

  def new
    @article = Article.new
    @profile = current_user.profile
  end

  def create
    @article = Article.new(article_params)
    @article.statut = "no"
    @profile = current_user.profile
    @article.profile = @profile

    if @article.save
      redirect_to root_path
      flash[:notice] = "L'article a été sauvegardé et sera validé par un Admin avant affichage."

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.where(statut: "yes")
    @profile = Profile.find(@article.profile_id)
  end


  def edit
    @article = Article.find(params[:id])
    @profile = Profile.find(@article.profile_id)
  end

  def update
    @article = Article.find(params[:id])
    @profile = Profile.find(@article.profile_id)
    @article.profile = @profile
    @article.update(article_params)
    redirect_to root_path
    flash[:notice] = "L'article a été édité, merci !"
  end

  def valider_article
    @article = Article.find(params[:articleid])
    @article.statut = "yes"
    if @article.save
      flash[:notice] = "L'article a été validé et sera automatiquement affiché . Merci."
      redirect_to pages_admin_path
     else
      flash[:notice] = "Oops, une erreur est survenue . "
      redirect_to pages_admin_path
    end
  end

  def refuser_article
    @article = Article.find(params[:articleid])
    @article.destroy_all
    flash[:alert] = "L'article a été refusé et sera effacé de la base de donnée."
    redirect_to pages_admin_path
  end




  #def valider_article
  #  @article = Article.find(params[:articleid])
  #  @profile = Profile.find(params[:profileid])
  #  @article.status = "Validé"
  #  @article.save
  #  flash[:notice] = "L'article a été validé. Merci."
  #  redirect_to profile_article_path(@profile, @article)
  #end

  #def refuser_article
   # @article = Article.find(params[:articleid])
   # @profile = Profile.find(params[:profileid])
   # @article.status = "Refusé"
   # @article.save
   # flash[:alert] = "L'article a été refusé."
  #  redirect_to profile_article_path(@profile, @article)
  #end

  private

  def article_params
  params.require(:article).permit(:title, :content, :photo, :theme, :photo_cache, :status, :id )
  end
end
