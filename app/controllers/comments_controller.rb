class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update]

  def new
    @comment = Comment.new
  end

  def create

    comment = Comment.create(comment_params)
    if comment.user == nil
    comment.build_user(username: params[:comment][:user_attributes][:username])
    comment.save
  end
    binding.pry if comment.user == nil 
    # comment.build_user(username: params[:comment][:users][:username])
    # comment.save
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, comment_user_attribute:[:username])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
