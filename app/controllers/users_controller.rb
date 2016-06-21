class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, your account has been created."
      redirect_to @user
    else
      flash.now[:danger] = "Your account has not been created."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
