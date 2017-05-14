class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.authenticate(params[:name], params[:password])
     if user && user.ip_check( request.remote_ip )
       session[:user] = user.id
       redirect_to contracts_path
     else
       flash.now.alert = user ? "неправильный IP. Должен быть #{ user.ip_address }, полуен #{ request.remote_ip }" :  "неправильные имя или пароль"
       render "new"
     end
  end

  def destroy
    session[:user] = nil
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end
end
