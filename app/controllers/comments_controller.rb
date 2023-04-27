class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to article_path @article
    else
      render "articles/show"
    end

  end

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments.find(params[:id])
    comment.destroy

    redirect_to article_path(article), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
