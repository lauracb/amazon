class UserNotifierMailer < ApplicationMailer
    default from: 'hello@amazon-clone.com'

    # send a signup email to the user
    def send_subscribe_email(subscriptor)
        @subscriptor = subscriptor
        @subject = "Thanks for subscribe for our amazing app"
        mail(to: @subscriptor.email, subject: @subject)
        # mail(to: , from: , subject:) #El mail puede enviar estos tres parámetros 
    end

    def new_post_notifying(email, title, id, type_user)
        @email = email
        @title = title
        @id = id
        @type_user = type_user
        @url = "https://amazon-makeitblog.herokuapp.com/posts/#{@id}" # funciona para ambiente de producción
        #@url = "http://localhost:3000/posts/#{@id}"   #funciona para ambiente de desarrollo
        mail(to: @email, subject: "#{@title} - #{@type_user} New blog post on Amazon-MakeitBlog")
    end

    # def new_post_notifying_user(email, title, id)
    #     @email = email
    #     @title = title
    #     @id = id
    #     @url = "https://amazon-makeitblog.herokuapp.com/posts/#{@id}" # funciona para ambiente de producción
    #     #@url = "http://localhost:3000/posts/#{@id}"   #funciona para ambiente de desarrollo
    #     mail(to: @email, subject: "#{@title} - New blog post on Amazon-MakeitBlog")
    # end

    # def new_post_notifying_subscriptor(subscriptor_email, title, id)
    #     @subscriptor_email = subscriptor_email
    #     @title = title
    #     @id = id
    #     @url = "http://localhost:3000/posts/#{@id}"
    #     #@url = "https://amazon-blog1.herokuapp.com/posts/#{@id}"
    #     mail(to: @subscriptor_email, subject: "#{@title} - Subscriptor / New blog post on Amazon-Clone")
    # end

    
    def update_post_notifying(email, title, id, type_user)
        @email = email
        @title = title
        @id = id
        @type_user = type_user
        @url = "https://amazon-makeitblog.herokuapp.com/posts/#{@id}" # funciona para ambiente de producción
        #@url = "http://localhost:3000/posts/#{@id}"   #funciona para ambiente de desarrollo
        mail(to: @email, subject: "#{@title} - #{@type_user} Blog post updated on Amazon-MakeitBlog")
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



