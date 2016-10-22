class SessionsController < ApplicationController
  def create
    @session = Session.create!(session_create_params)
    render json: @session
  rescue => e
    render json: { error: e.message }, status: :forbidden
  end

  def destroy
    @session = Session.find_by!(session_find_params)
    @session.destroy!
    render json: @session
  end

  private

  def session_create_params
    {
      username: params.require(:username),
      password: params.require(:password)
    }
  end

  def session_find_params
    {
      username: params.require(:id) # id es el que le viene por url
    }
  end
end
