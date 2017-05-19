class SessionsController < ApplicationController
  include Auth

  # before_action :get_current_user, except: [:new, :create]

  skip_before_action :get_current_user, only: [:new, :create]


  def new
  end

  def create
    @current_user = User.authenticate(params[:name], params[:password])

    if @current_user && @current_user.ip_check( request.remote_ip )
      session[:current_user_id] = @current_user.id

    else
      msg = @current_user ? "Невірний IP. Має бути #{ user.ip_address }, отримано #{ request.remote_ip }" :  "невірне ім’я або пароль"
      destroy msg
    end
  end

  def destroy(msg)
    session[:current_user] = nil
    reset_session
    flash[:notice] = "#{msg}, Сеанс завершено."
    redirect_to root_url
  end

  def index

  end


end