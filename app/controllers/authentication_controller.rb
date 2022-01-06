class AuthenticationController < ApplicationController

    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = generateToken
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         username: @user.username }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
    
    
      def signup
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end 

      private
      def user_params
        params.permit(
          :username, :email, :password)
      end
      def generateToken
        loop do
        token = SecureRandom.urlsafe_base64
        break token 
      end
      end
end
