class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render nothing: true
  end
end
