class UsersController < ApplicationController
   before_action :require_login,  only:[:show, :update, :destroy]
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end    

    def create
        @user = User.create(params.require(:user).permit(:email, :username, :password))

        if @user.save                  
            redirect_to '/users' 

        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to new_user_url    
        end
    end 
    

    def show
         @users = User.find(params[:id])
        if  @users == current_user 
                @users
        else  
            flash[:errors] = @users.errors.full_messages 
            redirect_to '/users'
        end   
    end 

    def edit
        @user = User.find(params[:id])
        if  @user == current_user || is_admin?
            @user
        else  
             flash[:alert] = @user.errors.full_messages 
            redirect_to '/users' 
        end   
    end
    
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(params.permit(:username, :email, :password))
            redirect_to '/users'
        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to edit_user_url
        end
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end 
end
