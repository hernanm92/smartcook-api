module Authentication
=begin
  extend ActiveSupport::Concern
  included do
    before_filter :authenticate
  end

  def authenticate
    session = validate_token(request.headers['X-Auth-Token']) # me devuelve la sesion, o si esta expirada o no?
    # tambien validar que el header no venga vacio

    unless authorized
      render json: { error: 'unauthorized' }, status: :unauthorized
      return
    end

    response.headers['X-Auth-Token'] = session[:token]
    response.headers['X-Auth-Expiration'] = session[:expiration]
  end

  def validate_token
    # do
  end
=end
end
