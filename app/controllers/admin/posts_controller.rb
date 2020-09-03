class Admin::PostsController < Admin::BaseController
    before_action :authenticate_user!

    def index
        @posts = Post.all
    end
end