class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    params[:comment][:user_id] = current_user.id
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    print "Ailo : " , params
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to article_path(@article) , notice: "Comment Deleted Successfully"
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :user_id)
    end
end
