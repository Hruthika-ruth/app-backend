class ApplicationController < ActionController::API
  attr_reader :current_user

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header.present?
    if header
      begin
        @decoded = JWT.decode(header, Rails.application.secrets.secret_key_base)[0]
        @current_user = User.find(@decoded['user_id'])
      rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
      end
    else
      render json: { errors: 'Nil JSON web token' }, status: :unauthorized
    end
  end
end
