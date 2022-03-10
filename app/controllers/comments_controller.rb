class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment !=""
      @comment.save
      redirect_to item_path(@item[:id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      @comment.destroy
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end