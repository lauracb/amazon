class CommentsController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @comment = Comment.find(params[:post_id,]   
  # end

  def create
    # byebug # Sirve para mostrar desde consola los errores cuando se está corriendo la app
    @post = Post.find(params[:post_id]) #se utiliza params[:post_id] ya que se toma del query string
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    @comment.save

    redirect_to post_path(@post)
    
    # if @comment.save
    #   redirect_to post_comment_path(post.id), notice: "Post created successfully"
    # else
    #   render :new, alert: "Post failed to be created. Try again"
    # end

  end


  private
 def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end


end