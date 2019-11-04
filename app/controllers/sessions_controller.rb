class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user
            redirect_to '/login'
        elsif  @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/welcome'
        end
    end
end