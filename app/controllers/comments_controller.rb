class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
  
  end

  def create
  
    @comment = Comment.new(comment_params)  
    if @comment.save
      redirect_to forums_path
    end

  end

  def edit
  
  end

  def destroy
  
  end

  private

  def comment_params
    #render json:params
    params.require(:comment).permit(:comment_body, :post_id, :posted_by)
  end
end
