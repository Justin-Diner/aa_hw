class UserMailer < ApplicationMailer
	def welcome_email(user)
    # your code here
		def welcome_email(user)
			@user = user
			@url  = 'http://example.com/login'
			mail(to: user.email, subject: 'Welcome to My Awesome Site')
		end
  end
end
