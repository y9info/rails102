class UserMailer < ApplicationMailer
    default_from: 'y9info@163.com'
    def welcome_email(user)
        @user = user
        @url = 'https://morning-woodland-69828.herokuapp.com/users/sign_in'
        mail(to: @user.email, subject: 'Welcome to the Yunjiu Info website!')
    end
end
