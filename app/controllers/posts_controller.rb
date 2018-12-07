class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] #Vamos a exigir que el usuario esté loggeado para poder ingresar a show, sino no puede entrar
  #before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]


  def index
    if params[:category].blank? #también se puede usar .present?
      @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
      #@posts = current_user.posts
      @last_post = Post.last #Esta variable la creo con el obj de renderizarla en _jumbotron
      @category = Category.all

      @shoes_category = Category.find_by(name: "Shoes")
      @shoes_last_post = @shoes_category.posts.last

      @woman_category = Category.find_by(name: "Woman")
      @woman_last_post = @woman_category.posts.last
    else
    @category_id = Category.find_by(name: params[:category]).id
    @posts = Post.where(category_id: @category_id)
                 .order(created_at: :desc)
                 .paginate(page: params[:page], per_page: 2)
    end
  end

  def new
    @post = Post.new  #Crea un objeto nuevo
  end

  def create
    @post = Post.new(post_params)  #Esta ruta viene ligada con el método post, donde se crea el númevo post
    #post_params es un método que debe ir creado como un método privado, ya que lo ideal es que desde afuera no nos llamen este método. Evitar usuarios maliciosos que creen por JS otros campos
    @post.user = current_user  # lo del current_user está dentro de la gem devise

    if @post.save
      # send email to users with new post
      title = @post.title
      id = @post.id
      
      users = User.where(role: "user")
      subscriptors = Subscriptor.all

      users.each do |user|
        email = user.email
        type_user = "User"
        UserNotifierMailer.new_post_notifying(email, title, id, type_user).deliver_now
      end

      subscriptors.each do |subscriptor|
        email = subscriptor.email
        type_user = "Subscriptor"
        UserNotifierMailer.new_post_notifying(email, title, id, type_user).deliver_now
      end

      ## con el código de 
      #   UserNotifierMailer.new_post_notifying_user(user_email, title, id).deliver_nowarriba se refactorizó el siguiente: también se modificó en user_notifier_mailer.rb y se agregó la view con el método new_post_notifying.html.erb
      # users.each do |user|
      #   user_email = us
      #   UserNotifierMailer.new_post_notifying_user(user_email, title, id).deliver_nower.email
      #   UserNotifierMailer.new_post_notifying_user(user_email, title, id).deliver_now
      # end

      # subscriptors.each do |subscriptor|
      #   subscriptor_email = subscriptor.email
      #   UserNotifierMailer.new_post_notifying_subscriptor(subscriptor_email, title, id).deliver_now
      # end

      redirect_to posts_path, notice: "Post created successfully"
    else
      flash[:alert] = "Post failed to be created. Try again"
      render :new
    end

  end

  def show
    @post = Post.find(params[:id]) #Lo nombro en singular ya que sólo voy a mostrar un post (usamos .find y no con .find_by ya que recibimos un id por la URL)
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
    

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      ## enviar un correo nuevo a los users y subscriptors cuando se edita un nuevo post
      title = @post.title
      id = @post.id   
      users = User.where(role: "user")
      subscriptors = Subscriptor.all

      users.each do |user|
        email = user.email
        type_user = "User"
        UserNotifierMailer.update_post_notifying(email, title, id, type_user).deliver_now
      end

      subscriptors.each do |subscriptor|
        email = subscriptor.email
        type_user = "Subscriptor"
        UserNotifierMailer.update_post_notifying(email, title, id, type_user).deliver_now
      end



      redirect_to posts_path, notice: "Post updated successfully"
    else
      render :edit, alert: "Post failed to be edited. Try again"
    end

  end

  def destroy
    post = Post.find(params[:id]) #No se utiliza variables de instancia ya que se elimina desde la misma página
    post.destroy
    ## Otra forma de escribir el flash notice y el flash alert
    #flash[:notice] = "El post fue eliminado exitosamente"
    redirect_to posts_path, notice: "Post deleted successfully"
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :category_id)
    end

    # def validate_user
    #   unless current_user.posts.ids.to_s.include? params[:id]
    #     redirect_to root_path
    #     flash[:alert] = "You don't have permissions"
    #   end
    # end

    def is_admin?
      unless current_user.admin?
        flash[:alert] = "You don't have permissions"
        redirect_to root_path
      end
    end
end
