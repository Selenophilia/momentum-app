class TagsController < ApplicationController
    def index
        @tags = Tags.All
    end 

    def def new
        @tag = Tags.new
    end
    
    def create
        @tag = Tags.create(params.require(:tags).permit(:name))
        if @tag.save
            redirect_to tags_path
        else    
            redirect_to new_create_path
        end

    end
    
    def show
        @tag = Tags.find(params[:id])
    end

    def edit
        @tag = Tags.find(params[:id])
    end

    def update
        @tag = Tags.find(params[:id])
        if @tag
            tag.update(params.require(:tags).permit(:name))
            redirect_to show_tags_path
        else
            redirect_to update_tags_path
        end
    end

    def destroy
        @tag = Tags.find(params[:id])
        if @tag
            @tag.destroy
            redirect_to tags_path
        else
            redirect_to show_tags_path
        end
    end    
end
