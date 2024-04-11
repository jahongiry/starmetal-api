module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
      skip_before_action :authenticate_request, only: [:create]

      def index
        @users = User.all
        render json: @users
      end

      def show
        render json: @user
      end

      def create
        @user = User.new(user_params)

        if @user.save
          token = generate_token(@user.id)
          render json: { user: @user, token: token }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end


      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end


      def set_user
        @user = User.find(params[:id])
      end

      def generate_token(user_id)
        JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base)
      end
    end
  end
end
