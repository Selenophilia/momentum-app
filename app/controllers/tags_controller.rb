class TagsController < ApplicationController
    def index
        @tags = Tag.All
    end 

    def  new
        @tag = Tag.new
    end
    
    def create
        @tag = Tag.create(params.require(:tags).permit(:name, :author_id, :quotes_id))
        if @tag.save
            redirect_to authors_quotes_tag_path
        else    
            redirect_to create_author_quotes_tag_path
        end

    end
    
    def show
        @tag = Tag.find(params[:id])
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        if @tag
            tag.update(params.permit(:name,:author_id, :quotes_id))
            redirect_to show_author_quotes_tag_path
        else
            redirect_to update_author_quotes_tag_path
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        if @tag
            @tag.destroy
            redirect_to authors_quotes_tag_path
        else
            redirect_to authors_quotes_tag_path
        end
    end    
end
