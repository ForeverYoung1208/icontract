class SessionsController < ApplicationController
  include Auth

  # before_action :get_current_user, except: [:new, :create]

  skip_before_action :get_current_user, only: [:new, :create]

  layout "login"



  def new

  end

  def create
    @current_user = User.authenticate(params[:name], params[:password])

    if @current_user && @current_user.ip_check( request.remote_ip )
      session[:current_user_id] = @current_user.id
      cookies.signed[:current_user_id] = @current_user.id
      render layout: "application"      

    else
      msg = @current_user ? "Невірний IP. Має бути #{ @current_user.ip_address }, отримано #{ request.remote_ip }" :  "невірне ім’я або пароль"
      destroy msg
    end
  end

  def destroy(msg="Сеанс завершено.")
    session[:current_user_id] = nil
    cookies.signed[:current_user_id] = nil
    reset_session
    flash[:notice] = msg
    redirect_to root_url
  end

  def index
    render layout: "application"
  end




  def start_morning_check_job
    # res = MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day).perform_later        
    res = MorningCheckJob.perform_later

    # works, but sends to all
    # ActionCable.server.broadcast("notification_channel", data)

#    NotificationChannel.broadcast_to(@current_user.id, data)

    redirect_to sessions_path notice: "MorningCheckJob started: #{res}"

  end



end
