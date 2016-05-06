class UserRegistrationsController < ApplicationController
  layout "access_pages"
  #skip_before_filter :require_login, :only => [:index, :new, :create, :activate]

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => t(:user_activation_success_notice))
    else
      not_authenticated
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      flash[:info] = t(:user_activation_create_notice)
      redirect_to(root_path)
    else
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
