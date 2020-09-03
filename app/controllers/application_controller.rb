class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if current_user.admin
            admin_posts_url(subdomain: 'admin')
        else
            posts_path
        end
    end

    def after_sign_out_path_for(resource_or_scope)
        posts_url(subdomain: nil)
    end
end
