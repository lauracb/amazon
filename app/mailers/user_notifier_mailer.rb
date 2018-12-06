class UserNotifierMailer < ApplicationMailer
    default from: 'hello@amazon-clone.com'

    # send a signup email to the user
    def send_subscribe_email(subscriptor)
        @subscriptor = subscriptor
        @subject = "Thanks for subscribe for our amazing app"
        mail(to: @subscriptor.email, subject: @subject)
        # mail(to: , from: , subject:) #El mail puede enviar estos tres parámetros 
    end

    ## se pueden crear la cantidad de métodos que necesite para notificar algo, este es otro con un ej de cancelación
    # def cance_account(user, admin, content)
    # end

end

# VARIABLES DE ENTORNO PARA TRABAJAR EN LOCAL Ó DEVELOPMENT / PRODUCCIÓN
# --> aquí está la seguridad de la aplicación.
# Username 
# Password
# User_token : ABDC / CDFRG
# Pass_token : sha256



