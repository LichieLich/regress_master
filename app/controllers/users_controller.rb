class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = set_user
  end

  def update
    @user = set_user

    if @user.update(user_params)
      redirect_to users_url, notice: 'Пользователь успешно создан'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new name: user_params[:name]

    if @user.save
      redirect_to users_url, notice: 'Пользователь успешно создан'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    set_user

    @user.destroy
    redirect_to users_url, notice: 'Пользователь успешно удалён'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
