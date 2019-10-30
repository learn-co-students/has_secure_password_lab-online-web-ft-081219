class WelcomeController < ApplicationController
    before_action :logged_in

    def home
        @user = User.find_by(id: session[:user_id])
    end

    private

    def logged_in
        return head(:forbidden) unless session.include? :user_id
    end
end