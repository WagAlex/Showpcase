class CommentsController < InheritedResources::Base
  before_action :set_comment, only: [:show, :update, :destroy]

  def new
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:comment][:user_id]
    @comment.shop_id = params[:shop_id]
    @comment.save
    redirect_to shop_path(params[:shop_id])
  end

  private
   def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :shop_id)
    end
end
