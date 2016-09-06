class BadgesController < ApplicationController
  def index
    @badges = BadgePerUser.where(username: params[:username]).map(&:badge) if params[:username]
    @badges = Badge.all unless @badges
    render json: @badges
  end

  def show
    @badge = Badge.find_by!(badge_find_params)
    render json: @badge
  end

  def create
    @badge = Badge.create!(badge_create_params)
    render json: @badge
  end

  def update
    @badge = Badge.find_by!(badge_find_params)
    @badge.update! badge_update_params
    render json: @badge
  end

  def destroy
    @badge = Badge.find_by!(badge_find_params)
    @badge.destroy!
    render json: @badge
  end

  private

  def badge_create_params
    {
      name: params.require(:name),
      description: params.require(:description)
    }
  end

  def badge_find_params
    {
      id: params.require(:id)
    }
  end

  def badge_update_params
    params.slice(:name, :description).permit!
  end
end
