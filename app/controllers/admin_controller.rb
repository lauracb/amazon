class AdminController < ApplicationController
  layout "admin" # el layout se pone fuera de las acciones, para que aplique en todas ellas
  #layout "admin", only[:index] #el layout sólo aplicaría en la vista index
  #layout "admin", except[:index] #el layout carga sólo para todas las acciones, excepto index
  #layout false #no me va a cargar ningún error (Ej: quiero que se renderice un error 404)

  def index
    #render layout: "admin" #si quiero que el layout sólo aplique en esta vista.
  end

end
