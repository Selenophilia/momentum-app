class QuotesController < ApplicationController
    def index
        @author = Author.where(id: params[:author_id])
        @quotes = Quote.where(author_id: params[:author_id])
        @get_tag  = Tag.joins(quotation_tags: :quote ).limit(1)
        
    end 
   
    def new
        @quote = Quote.new
        @tag = Tag.all

    end

    def create
        @quote = Quote.new(quote_params)
        byebug

        if  @quote.save 
            # @quote_tags = @quote.quotation_tags.create(tag_id: @tag_id)                  
            # @quote_tags.save
            redirect_to authors_quotes_path
        else
            flash[:errors] = @quote.errors.full_messages 
            redirect_to new_author_quotes_url   
        end 
    end 

    def show
        @quotes = Quote.find(params[:id])
    end

    def edit
        if is_admin? 
            @quotes = Quote.find(params[:id])
            @author = Author.find(params[:author_id])               
            #@get_tag = @quotes.tags.first 
            #Tag.joins(:quotation_tags).where(quotation_tags: { quote_id: params[:id] }).first            
        else    
            flash[:errors] = "You are not Authorized to that!"
            redirect_to authors_quotes_path
        end
    end  

    def update
        @quotes = Quote.find(params[:id])
        @author = Author.find(params[:author_id])  
        if @quotes
            #byebug
            @quotes.update(quote_params)
            
            @author.update(params.permit(:author_name))
            
            #redirect_to show_author_quotes_path
            redirect_to authors_quotes_path
        else
            flash[:errors] = @articles.errors.full_messages 
            redirect_to show_author_quotes_path
        end

    end 

    def destroy
        @quotes = Quote.find(params[:id])
        if @quotes
            @quotes.destroy                
            redirect_to authors_quotes_url
        end 
    end

    private

    def quote_params
        params.permit(:description, :author_id, tag_ids: []) 
    end

end 
