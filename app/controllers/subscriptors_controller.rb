class SubscriptorsController < ApplicationController
  
  protect_from_forgery with: :null_session
  #before_action :authenticate_user!
  before_action :find_subscriptor, only: [:show, :edit, :update, :destroy]
  layout "signin", only: [:new, :create]
  
  def index
    @subscriptors= Subscriptor.all.order(created_at: :desc)
    #render  json: @subscriptors

    respond_to do |format|
      format.html
      format.json {render  json: @subscriptors}
    end

  end

  def new
    @subscriptor = Subscriptor.new  #Crea un objeto nuev
    #byebug herramienda indispensable para debuggear o depurar y hacer que la ejecución pare ahí
    # para salir de la consola usando el byebug, se borra del código y se escribe c, de continuar en la cnosola
  end

  def create
    @subscriptor = Subscriptor.new(subscriptor_params) 
    
    respond_to do |format|

      if @subscriptor.save
        # send subscriptor mail
        UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now

        format.html {redirect_to posts_path, notice: "Subscription successfully"}
        format.json {render :show, status: :created}
      else
        format.html {render :new, notice: "Hubo un error, favor suscribirse de nuevo" }
        format.json {render json: @subscriptor.errors, status: :unprocessable_entity }
      end

    end

  end
  
  def show  
    respond_to do |format|
      format.html
      format.json {render json: @subscriptor}
    end
  end

  def edit
    
  end
  
  def update
    respond_to do |format|
      if @subscriptor.update(subscriptor_params)
        format.htm {redirect_to subscriptor_path(@subscriptor)}
        format.json {render :show, status: :ok}
      else
        format.html{render :edit}
        format.json{render json: @subscriptor.errors, status: :unprocessable_entity}
      end
      
    end
  end

  def destroy
    @subscriptor.destroy 
    
    respond_to do |format|
      format.html {redirect_to subscriptors_path, notice: "Subscriptor was removed successfully"}
      format.json {head :no_content}
    end
  end

  private
  # Este método se conoce como Strong parameters: método privado donde se hace una lista blanca de campos que con anticipación se le dice a Rails que el usuario debe ingresar y guardar esos datos
  def subscriptor_params
     params.require(:subscriptor).permit(:name, :email)
   end

   def find_subscriptor
     @subscriptor = Subscriptor.find(params[:id])
   end
end
