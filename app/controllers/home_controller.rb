class HomeController < ApplicationController
#Aquí contruiremos el CRUD
  def index
    @hola = "Hola mundo"
    #render html:"<h1>Hola mundo</h1>".html_safe #Otra forma de renderizar html. 
  end

  def about
    #redirect_to blog_index_path # redirecciona completamente y cambia la URL
  end

  def contact_us
    #render :prices # muestra la vista de prices, pero no cambia la URL
  end

  def prices
    #redirect_to "http://google.com"
  end

  # def hello
  #   @name = params[:name]
  # end
end

