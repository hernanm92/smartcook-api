class BadgesPerUsersController < ApplicationController
  def create
    @badge_per_user = BadgePerUser.create!(badges_per_users_create_params)
    render json: @badge_per_user
  end

  def update
    @badge_per_user = BadgePerUser.find_by!(badges_per_users_find_params)
    @badge_per_user.update! badges_per_users_update_params
    render json: @badge_per_user
  end

  def destroy
    @badge_per_user = BadgePerUser.find_by!(badges_per_users_find_params)
    @badge_per_user.destroy!
    render json: @badge_per_user
  end

  private

  def badges_per_users_create_params
    {
      badge_id: params.require(:badge_id),
      username: params.require(:username)
    }
  end

  def badges_per_users_find_params
    {
      badge_id: params.require(:badge_id),
      username: params.require(:username)
    }
  end

  def badges_per_users_update_params
    {}
  end
end
