class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'te has registrado con exito'
    else
      redirect_to users_sign_up_path, notice: 'no te has regristado :C'
    end
  end

  def show
    @histories = helpers.current_user.histories
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
