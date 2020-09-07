class Admin::PostsController < Admin::BaseController
    def index
        @posts = Post.all

        respond_to do |format|
            format.html
            format.csv { send_data @posts.to_csv }
            format.xls # { send_data @posts.to_csv(col_sep: "\t") }
        end
    end
end