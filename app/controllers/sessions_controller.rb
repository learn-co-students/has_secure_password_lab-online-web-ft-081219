class SessionsController < ApplicationController
    #login
    def new
    end
    
    def create
        @user = User.find_by(name:login_params[:name])
        return head(:forbidden) unless @user.authenticate(login_params[:password])
        session[:user_id] = @user.id
    end

    #logout
    def delete
        session.delete :user_id
        redirect_to '/login'
    end

    private

    def login_params
        params.require(:user).permit(:name,:password)
    end
end