class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if current_user.admin
            admin_posts_path
        else
            posts_path
        end
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end
end
