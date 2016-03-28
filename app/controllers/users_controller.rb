class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create user_params
  	if (@user.persisted? && @user.password_confirmation == @user.password)
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def index
    
  end

  def show
    @user_events = UserEvent.where(user_id: current_user.id)
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
