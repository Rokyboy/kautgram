class UserController < ApplicationController
    def show
        @user = User.find_by(nick_name: params[:id])
    end
end
