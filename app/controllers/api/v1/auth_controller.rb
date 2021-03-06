class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(email: user_login_params[:email])
        
        if user && user.authenticate(user_login_params[:password])
          my_token = issue_token(user)
    
          render json: {user: UserSerializer.new(user, :include => [:map_markers]), token: my_token}, status: :accepted
        else
          render json: {error: 'User could not be logged in. Please enter the correct email and password, or sign up to create a new account'}, status: :unauthorized
        end
    end
    
    def show
      if logged_in?
        render json: { user: UserSerializer.new(current_user, :include => [:map_markers]) }, status: :accepted
      else
        render json: {error: 'Not logged in'}, status: :unauthorized
      end
    end

    private
 
    def user_login_params
      params.require(:user).permit(:email, :password)
    end
end