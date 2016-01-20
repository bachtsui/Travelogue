class ArticlesController < ApplicationController

  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to article_path(@article)
    else
      flash[:error] = @article.errors.full_messages.join(", ")
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def edit
    @article = Article.find_by_id(params[:id])
    unless current_user == @article.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @article = Article.find_by_id(params[:id])
    if current_user == @article.user
      if @article.update_attributes(article_params)
        flash[:notice] = "Successfully updated article."
        redirect_to article_path(@article)
      else
        flash[:error] = @article.errors.full_messages.join(", ")
        redirect_to edit_article_path(@article)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    if current_user == @article.user
      @article.destroy
      flash[:notice] = "Successfully deleted article."
    end
    redirect_to user_path(current_user)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
