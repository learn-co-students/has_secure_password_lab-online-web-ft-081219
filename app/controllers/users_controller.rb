class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.password != user.password_confirmation
            flash[:alert]='Password and Password confirmation failed to match. Try again.'
            redirect_to action:'new'
        else
            user.save
            session[:user_id] = user.id
            redirect_to :root
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end