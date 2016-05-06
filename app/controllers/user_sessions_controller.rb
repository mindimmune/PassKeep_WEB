class UserSessionsController < ApplicationController
  layout "access_pages"

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: t(:login_succeed))
    else
      flash.now[:alert] = t(:login_failed)
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: t(:logged_out))
  end
end
