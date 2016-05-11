class UserRegistrationsController < ApplicationController
  layout "access_pages"

  skip_before_filter :require_login, :only => [:new, :create, :activate]

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:success] = t('registration.user_activation_success_notice')
    else
      flash[:danger] = t('registration.user_activation_fail_notice')
    end
    redirect_to signin_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      flash[:info] = t('registration.user_activation_create_notice')
      redirect_to(signin_path)
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
