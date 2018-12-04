class BlogController < ApplicationController
  def index
  end

  def new
    # get
  end

  def show
  end

  def edit
    #get
  end

#   # A partir de aquí es explicación de otros métodos comunes
#   def create
#     #post  
#     if condition
#       # si se cumple, hace la transacción en la base de datos y redirecciona a lo que quiera
#       redirect_to home_about_path
#     else
#       # si falla
#     render :new
#     end
#   end

#   def update
#    #post/put/patch
   
#     if condition
#       # si se cumple, hace la transacción en la base de datos y redirecciona a lo que quiera
#       redirect_to home_about_path
#     else
#       # si falla
#     render :edit
#     end
#   end

#   def delete
#     post/delete/destroy
#   end

end
