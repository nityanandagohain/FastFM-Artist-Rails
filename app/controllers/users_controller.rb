class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(post_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/', notice: "Thank you for signing up!"
        else
            flash[:register_errors] = @user.errors.full_messages
            render "new"
        end
    end

    private

        def post_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
