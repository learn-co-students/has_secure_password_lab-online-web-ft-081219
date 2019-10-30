class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if passwords_match && @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            redirect_to '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def passwords_match
        params[:user][:password] == params[:user][:password_confirmation]
    end
end