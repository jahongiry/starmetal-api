# app/controllers/api/v1/sessions_controller.rb
module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request

      def create
        @user = User.find_by(email: params[:email])

        if @user && @user.valid_password?(params[:password])
          token = generate_token(@user.id)
          render json: { user: @user, token: token }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def generate_token(user_id)
        JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base)
      end
    end
  end
end
