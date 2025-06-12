module Api
  module V1
    class ProfilesController < ApplicationController
      def index
        render json: Profile.all
      end

      def show
        render json: Profile.find(params[:id])
      end

      def create
        profile = Profile.new(profile_params)
        if profile.save
          render json: profile, status: :created
        else
          render json: profile.errors, status: :unprocessable_entity
        end
      end

      def update
        profile = Profile.find(params[:id])
        if profile.update(profile_params)
          render json: profile
        else
          render json: profile.errors, status: :unprocessable_entity
        end
      end

      def destroy
        profile = Profile.find(params[:id])
        profile.destroy
        head :no_content
      end

      private

      def profile_params
        params.require(:profile).permit(:name, :gender, :bio, :user_id)
      end
    end
  end
end
