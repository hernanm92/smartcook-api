class FrequentUsersController < ApplicationController
  def create
    @frequent_user = FrequentUser.create!(frequent_users_create_params)
    render json: @frequent_user
  end

  def update
    @frequent_user = FrequentUser.find_by!(frequent_users_find_params)
    @frequent_user.update! frequent_users_update_params
    render json: @frequent_user
  end

  def destroy
    @frequent_user = FrequentUser.find_by!(frequent_users_find_params)
    @frequent_user.destroy!
    render json: @frequent_user
  end

  private

  def frequent_users_create_params
    {
      frequent_username: params.require(:frequent_username),
      username: params.require(:username)
    }
  end

  def frequent_users_find_params
    {
      frequent_username: params.require(:frequent_username),
      username: params.require(:username)
    }
  end

  def frequent_users_update_params
    {}
  end
end
