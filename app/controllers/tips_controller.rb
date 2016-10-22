class TipsController < ApplicationController
  def index
    @tips = Tip.where(recipe_id: params[:recipe_id]) if params[:recipe_id]
    @tips = Tip.all unless @tips
    render json: @tips
  end

  def show
    @tip = Tip.find_by!(tip_find_params)
    render json: @tip
  end

  def create
    @tip = Tip.create!(tip_create_params)
    render json: @tip
  end

  def update
    @tip = Tip.find_by!(tip_find_params)
    @tip.update! recipe_update_params
    render json: @tip
  end

  def destroy
    @tip = Tip.find_by!(tip_find_params)
    @tip.destroy!
    render json: @tip
  end

  def tip_find_params
    {
        id: params.require(:id) # id es el que le viene por url
    }
  end

  def tip_create_params
    {
        description: params.require(:description),
        recipe_id: params.require(:recipe_id),
        username: params.require(:username)
    }
  end
end
