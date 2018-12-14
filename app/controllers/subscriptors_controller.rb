class SubscriptorsController < ApplicationController
  
  layout "signin"
  
  def index
    
  end

  def new
    @subscriptor = Subscriptor.new  #Crea un objeto nuev
    #byebug herramienda indispensable para debuggear o depurar y hacer que la ejecución pare ahí
    # para salir de la consola usando el byebug, se borra del código y se escribe c, de continuar en la cnosola
  end

  def create
    @subscriptor = Subscriptor.new(subscriptor_params) 
    
    if @subscriptor.save

      # send subscriptor mail
      UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now

      redirect_to posts_path, notice: "Subscription successfully"
    else
      flash[:alert] = "Subscription failed. Try again"
      render :new
    end

  end
  

  private
  # Este método se conoce como Strong parameters: método privado donde se hace una lista blanca de campos que con anticipación se le dice a Rails que el usuario debe ingresar y guardar esos datos
  def subscriptor_params
     params.require(:subscriptor).permit(:name, :email)
   end

end
