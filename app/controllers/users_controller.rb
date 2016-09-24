class UsersController < ApplicationController
  def index
    @users = User.find_by_username(params[:username]) if params[:username]
    @users = FrequentUser.where(username: params[:chef]) if params[:chef]
    @users = User.all unless @users
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
      diabetic: params[:diabetic]
    }
  end

  def user_find_params
    {
      username: params.require(:id) # id es el que le viene por url
    }
  end

  def user_update_params
    params.slice(:name, :email, :password, :avatar, :birthdate, :gender, :vegetarian, :vegan, :celiac, :diabetic)
          .permit!
  end
end
