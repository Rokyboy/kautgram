class UserController < ApplicationController
    def show
        if params[:id]
            @user = User.find_by(nick_name: params[:id])
        else
            @user = current_user
        end
    end
end
