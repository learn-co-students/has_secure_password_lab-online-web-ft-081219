class SessionsController < ApplicationController 
    def create 
        user = User.find_by(name: login_param[:name])
        if user &&  user.authenticate(login_param[:password])
            session[:user_id] = user.id
        end
    end


    private 
    def login_param 
        params.require(:user).permit(:name,:password)
    end
end