class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
  end
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    ExampleJob.perform_later

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to article_path @article }
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments.find(params[:id])
    comment.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(comment) }
      format.html { redirect_to article_path(article), status: :see_other }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
