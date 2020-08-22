class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy, :show]
    before_action :authenticate_user!, except: [:index, :show]

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
            flash[:success] = "Post was successfull created"
            redirect_to post_path(@post)
        else 
            render 'new'
        end
    end

    def show
        @post.punch(request)
    end

    def edit
    end

    def update
        if @post.update(post_params)
            flash[:success] = "Post was updated"
            redirect_to post_path(@post)
        else 
            flash[:success] = "Post was not updated"
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        flash[:success] = "Post was deleted"
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :body, :image)
        end

    private 
        def set_post
            @post = Post.find(params[:id])
        end

end