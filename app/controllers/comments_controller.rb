class CommentsController < ApplicationController

  before_action :set_comment, only: [:create, :destroy]
  before_action :authenticate_user!,   only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user_id = current_user.id
    redirect_to product_path(@product)
    @comment = @product.save

  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private

    def set_comment
      @product = Product.find(params[:product_id])
    end

    # def correct_user
    #   @product = current_user.products.find(params[:id])
    #   redirect_to products_path if @product.nil?
    # end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
