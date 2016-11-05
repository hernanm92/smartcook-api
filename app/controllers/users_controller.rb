class UsersController < ApplicationController
  def index
    @users = User.all unless @users
    @users = @users.select { |user| user.enabled == true } # muestro solo los habilitados
    render json: @users
  end

  def show
    @user = User.find_by!(user_find_params)
    render json: @user
  end

  def create
    @user = User.create!(user_create_params)
    render json: @user
  end

  def update
    @user = User.find_by!(user_find_params)
    @user.update! user_update_params
    render json: @user
  end

  def destroy
    @user = User.find_by!(user_find_params)
    @user.destroy!
    render json: @user
  end

  def frequent_users
    @users = User.find_by!(user_find_params).users
    render json: @users
  end

  private

  def user_create_params
    {
      username: params.require(:username),
      name: params.require(:name),
      email: params.require(:email),
      password: params.require(:password),
      avatar: params[:avatar],
      birthdate: params[:birthdate],
      gender: params[:gender],
      vegetarian: params[:vegetarian],
      vegan: params[:vegan],
      celiac: params[:celiac],
      diabetic: params[:diabetic],
      admin: params[:admin] # solo lo agrego para nuestras migraciones
    }
  end

  def user_find_params
    {
      username: params.require(:id) # id es el que le viene por url
    }
  end

  def user_update_params
    params.slice(:name, :email, :password, :avatar, :birthdate, :gender, :vegetarian, :vegan, :celiac, :diabetic, :enabled)
          .permit!
  end
end
