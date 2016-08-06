class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  def index
    render json: { smartcook: 'api' }
  end

  def routing_error
    render json: { error: 'resource not found' }, status: params[:path].to_i == 0 ? :not_found : params[:path].to_i
  end
end
