class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, :except => [:not_authenticated]

  private
  def not_authenticated
    redirect_to signin_path, flash: { danger: t('requests.not_authenticated') }
  end
end
