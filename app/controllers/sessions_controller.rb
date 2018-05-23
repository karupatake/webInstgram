class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, alert:'ログインに成功しました'
    else
      flash.now[:danger]="ログインは失敗しました"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user =nil
  end

end
