class ArticlecommitsController < ApplicationController
  def new
    @articlecommit = Articlecommit.new
    @article = Article.find(params[:article_id])

  end

  def create
    @articlecommit = Articlecommit.new(article_params)
    @article = Article.find(params[:article_id])
    @articlecommit.article = @article
    @article.statut = "yes"

    if @article.save
      flash[:notice] = 'Votre message a été posté !'
      redirect_to root_path

    else
      render :new
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'

    end
  end

  private

  def article_params
    params.require(:articlecommit).permit(:title, :theme, :content, :statut)

  end
end
