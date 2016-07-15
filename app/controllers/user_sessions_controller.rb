class UserSessionsController < ApplicationController
  layout "access_pages"

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_path #, info: t('authentication.sign_in_succeed'
    else
      flash.now[:danger] = t('authentication.sign_in_failed')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to signin_path, flash: { info: t('authentication.signed_out') }
  end
end
