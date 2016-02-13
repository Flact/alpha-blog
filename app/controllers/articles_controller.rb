class ArticlesController < ApplicationController
    
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(ar_prms)
        if @article.save
            flash[:notice] = "Article was successfuly created!"
            redirect_to article_path(@article)
        else
            render :new
        end
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(ar_prms)
            flash[:notice] = "Article was successfuly Updated!"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    private
    
    def ar_prms
       params.require(:article).permit(:title, :description) 
    end
end