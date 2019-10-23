class UsersController < ApplicationController 
    def create 
        if matching_password
            user = User.create(name: user_param[:name], password: user_param[:password])
            session[:user_id] = user.id if user
        else
            redirect_to "/user/new"
        end
    end

    def new 
    end

    private 
    def user_param 
        params.require(:user).permit(:name,:password,:password_confirmation)
    end

    def matching_password 
        user_param[:password] == user_param[:password_confirmation] ? true : false
    end
end