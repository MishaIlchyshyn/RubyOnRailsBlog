class DiscardPostsController < ApplicationController
    def index
        @discard_posts = Post.discarded
    end

    def update
        discard_post = Post.find(params[:id])
        discard_post.undiscard
        redirect_to posts_path
    end
end