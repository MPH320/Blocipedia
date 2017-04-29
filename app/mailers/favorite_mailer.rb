class FavoriteMailer < ApplicationMailer
   default from: "michelangelo.ph@gmail.com"

   def registration_email(user)

     headers["Message-ID"] = "<comments/@your-app-name.example>"
  
 
     @user = user

     mail(to: user.email, subject: "New comment on #{post.title}")
   end
 end