class AdminController < ApplicationController
  
  before_action :authenticate_user! #este no se crea manualmente ya que viene con devise
  before_action :is_admin?

  layout "admin" # el layout se pone fuera de las acciones, para que aplique en todas ellas
  #layout "admin", only[:index] #el layout sólo aplicaría en la vista index
  #layout "admin", except[:index] #el layout carga sólo para todas las acciones, excepto index
  #layout false #no me va a cargar ningún error (Ej: quiero que se renderice un error 404)

  def index
    #render layout: "admin" #si quiero que el layout sólo aplique en esta vista.
    @users = User.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all.order(created_at: :desc)
    @subscriptors = Subscriptor.all.order(created_at: :desc)
  end


  private
  def is_admin?
    unless current_user.admin?
      flash[:alert] = "You don't have permissions"
      redirect_to root_path
    end
  end

end
