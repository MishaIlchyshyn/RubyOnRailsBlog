class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post was successfull created"
            redirect_to post_path(@post)
        else 
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id]) 
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post was updated"
            redirect_to post_path(@post)
        else 
            flash[:notice] = "Post was not updated"
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "Post was deleted"
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :description)
        end

end