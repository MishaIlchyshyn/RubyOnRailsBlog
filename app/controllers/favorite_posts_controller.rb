class FavoritePostsController < ApplicationController
    before_action :set_post, only: [:create, :destroy]
    before_action :authenticate_user!
    
    def index
        @favorite_posts = current_user.favorite_posts
    end

    def create
        if Favorite.create(favorited: @post, user: current_user)
            redirect_to posts_path, notice: 'Post has been favorited'
        else  
            redirect_to @post, alert: 'Something went wrong...*sad panda*'
        end
    end

    def destroy
        Favorite.where(favorited_id: @post.id, user_id: current_user.id).first.destroy
        redirect_to posts_path, notice: 'Project is no longer in favorites'
    end

    private
        def set_post
            @post = Post.find(params[:post_id] || params[:id])
        end
end