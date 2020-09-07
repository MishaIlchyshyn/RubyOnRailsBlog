class Admin::CommentsController < Admin::BaseController
    def index
        @comments = Comment.all

        respond_to do |format|
            format.html
            format.csv { send_data @comments.to_csv }
            format.xls # { send_data @comments.to_csv(col_sep: "\t") }
        end
    end
end