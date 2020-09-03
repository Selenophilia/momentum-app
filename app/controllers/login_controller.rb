class LoginController < ApplicationController
    
    #skip_before_action :authorized, only:[:new, :create]
    
    def new
        @user = User.new
    end    

    def create 
        @user =  User.find_by(username: params[:username])
          
        if @user && @user.authenticate(params[:password])

            session[:user_id] = @user.id

            redirect_to '/index'

        else    
            flash[:alert] = "Invalid Credentials"
            redirect_to '/login'
        end
    end 

    def signupnew
        @newuser = User.new
    end 

    def signupcreate
        @newuser = User.create(params.permit(:email, :username, :password))
        if  @newuser.save   

            session[:user_id] = @newuser.id

            #redirect_to '/users/' + @user.id.to_s
            
            redirect_to '/index' 

        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to login_user_signup_url    
        end
    end

    def delete
        session[:user_id] = nil
        redirect_to '/index'
    end 

    def welcome
        @time = Time.now.strftime("%H:%M ")
        @quotes = Quote.order('RANDOM()').limit(1)

    end 

    def get_time
        @time = Time.now.strftime("%H:%M:%S ")
        render partial: "date"
    end

end
