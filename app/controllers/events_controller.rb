class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update]

  before_action :set_events, only: [:index, :all, :mine]

  # GET /events
  # GET /events.json

  def index
    session[:events_list_type]||= {"all" => true}
    if session[:events_list_type]["mine"]
      redirect_to mine_events_path and return
    elsif session[:events_list_type]["all"] 
      redirect_to all_events_path and return
    else
      raise Exception.new('Error with events list')
    end

  end

  def all
    session[:events_list_type] = {"all" => true}

    @list_type = session[:events_list_type]

    render 'index'
  end

  def mine
    @events = @events.where("user_id = ?", session[:current_user_id])

    session[:events_list_type] = {"mine" => true}
    @list_type = session[:events_list_type]

    render 'index'
  end


  def all_send_emails
    res = Event.all_send_emails(params[:date], @current_user.id)

    # NotificationChannel.broadcast_to(
    #   @current_user.id,
    #   title: 'New things!',
    #   body: 'All the news fit to print'
    # )  


    # redirect_to sessions_path, notice: res
  end



  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Подію створено.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Подію оновлено.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    # @event.destroy

    

    respond_to do |format|
      event = Event.unscoped.where(id: params[:id]).first
      event.deleted_at = DateTime.now

      if @current_user.can_delete_events? && event.save(validate: false)
        format.html { redirect_to events_url, notice: 'Подію видалено.' }
        format.json { head :no_content }
      else
        format.html { redirect_to events_url, notice: "Помилка видлення. Подію не видалено #{@event.errors}" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @event.on_date = @event.on_date.strftime("%d.%m.%Y")

      # @event.from_date = @event.from_date.strftime("%d.%m.%Y")
      # @event.to_date = @event.to_date.strftime("%d.%m.%Y")      
    end

    def set_events
      @events = Event.all.where(:'user_id' => @current_user.allowed_users_ids)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:reminderable_id).permit(:date)
    end
end


