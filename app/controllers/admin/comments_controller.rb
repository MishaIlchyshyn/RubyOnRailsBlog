class Admin::CommentsController < Admin::BaseController
    before_action :authenticate_user!
    
    def index
        @comments = Comment.all
    end
end