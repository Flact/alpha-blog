class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(ar_prms)
        @article.save
        redirect_to articles_show(@article)
    end
    
    
    private
    
    def ar_prms
       params.require(:article).permit(:title, :description) 
    end
end