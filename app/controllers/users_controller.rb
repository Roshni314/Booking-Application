class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    @user.roles << Role.find_by(name: params[:user][:role])

    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end

  end 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :role_id)
  end
end
