class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end 

    def  new
        @tag = Tag.new
    end
    
    def create
        @tag = Tag.create(params.permit(:name))
        if @tag.save
            redirect_to tag_path
        else    
            redirect_to create_tag_path
        end

    end
    
    def show
        @tag = Tag.find_by(params[:id])
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        if @tag
            @tag.update(params.permit(:name))
            redirect_to tag_path
        else
            redirect_to update_tag_path
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        if @tag
            @tag.destroy
            redirect_to tag_path
        else
            redirect_to tag_path
        end
    end    
end
