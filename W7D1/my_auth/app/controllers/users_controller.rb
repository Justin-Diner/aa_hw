class UsersController < ApplicationController
	before_action :require_current_user!, except: %i(create new)
	
  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  def new
  end

	def show
		@user = User.new(user_params)
	end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end