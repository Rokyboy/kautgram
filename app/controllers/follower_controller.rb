class FollowerController < ApplicationController
    before_action :authenticate_user!

    def create
        @follower = Follower.create({ user_id: current_user.id, follow_id: params[:user_id] })

        if @follower.save
            redirect_to user_path(params[:user_id])
        else
            flash[:error] = @follower.errors.full_message
            redirect_to user_path(params[:user_id])
        end
    end

    def destroy
        @follower = Follower.where(user_id: current_user.id).find_by(follow_id: params[:user_id])

        if @follower.destroy
            redirect_to user_path(params[:user_id])
        else
            flash[:error] = @follower.errors.full_message
            redirect_to user_path(params[:user_id])
        end
    end
end