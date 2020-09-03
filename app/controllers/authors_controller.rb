class AuthorsController < ApplicationController
    before_action :require_login
    def index
        @author = Author.all
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.create(params.require(:author).permit(:author_name))
        if @author.save
            redirect_to authors_path
            puts @author
        else
            flash[:errors] = @author.errors.full_messages 
            redirect_to new_author_url    
        end
    end

    def show
        @author = Author.find(params[:id])
        #redirect_to show_author_url
    end 

    def edit
        @author = Author.find(params[:id])
    end 

    def update
        @author = Author.find(params[:id])

        if @author
            @author.update(params.permit(:author_name))
            #redirect_to show_author_url
            redirect_to authors_path
        else
            flash[:errors] = @author.errors.full_messages 
            redirect_to edit_author_url
        end 
    end 

    def destroy
        @author = Author.find(params[:id])
        if @author
            @author.destroy
            redirect_to authors_path
        end 
    end 

end
