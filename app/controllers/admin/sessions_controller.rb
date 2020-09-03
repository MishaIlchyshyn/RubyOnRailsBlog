class Admin::SessionsController < Devise::SessionsController
    # DELETE /resource/sign_out
    # def destroy
    #     @user = current_user
    #     super
    #     redirect_to posts_url(subdomain: nil) if @user.admin?
    #     return
    # end
end