class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  before_action :set_reminders, only: [:index, :all, :mine]

  # GET /reminders
  # GET /reminders.json
  def index
    session[:reminders_list_type]||= {"all" => true}
    if session[:reminders_list_type]["mine"]
      redirect_to mine_reminders_path and return
    elsif session[:reminders_list_type]["all"] 
      redirect_to all_reminders_path and return
    else
      raise Exception.new('Error with reminders list')
    end
  end

  #POST check_all
  def all_generate_events
    created_events_ids = Reminder.all_generate_events(params[:date])

    redirect_to events_path, notice: "events  id = #{created_events_ids} created, 0 for already existed"

  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @reminder_types = ReminderType.all
    reminderable = Contract.find( params[:contract_id] ) if params[:contract_id]
    reminderable = Akt.find( params[:akt_id] ) if params[:akt_id]

    @contracts = Contract.all
    @akts = Akt.all

    @reminder = Reminder.new( reminderable: reminderable, user: reminderable.responsible_user)


  end

  # GET /reminders/1/edit
  def edit
    @reminder_types = ReminderType.all

    @contracts = Contract.all
    @akts = Akt.all
        
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to edit_reminder_path(@reminder), notice: 'Нагадування створено.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        @reminder_types = ReminderType.all
        @contracts = Contract.all
        @akts = Akt.all
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update

    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to edit_reminder_path(@reminder), notice: 'Нагадування збережено.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    # @reminder.destroy

    respond_to do |format|
      if @reminder.update(deleted_at: DateTime.now)      
        format.html { redirect_back(fallback_location: reminders_url, notice: 'Нагадування видалено') }
        format.json { head :no_content }
      else
        format.html { redirect_to reminders_url, notice: "Помилка видляння. Нагадування не видалено #{@contract.errors}" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end      
    end
  end


  def all
    session[:reminders_list_type] = {"all" => true}
    @list_type = session[:reminders_list_type]
    render 'index'
  end

  def mine
    @reminders = @reminders.where("user_id = ?", session[:current_user_id])
    session[:reminders_list_type] = {"mine" => true}
    @list_type = session[:reminders_list_type]
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_reminders
      @reminders = Reminder.where(:'user_id' => @current_user.allowed_users_ids)
    end


    def set_reminder
      @reminder = Reminder.where(id: params[:id]).includes(:reminderable).first
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      case params[:reminder][:reminderable_type]
      when 'Akt'
        params[:reminder][:reminderable_id] = params[:reminder][:akt_id]
      when 'Contract'
        params[:reminder][:reminderable_id] = params[:reminder][:contract_id]
      else
        raise Exception.new(' Помилка із типом надаування (договір/акт)')
      end

      # params.delete('contract_id')
      # params.delete('akt_id')

      params.require(:reminder).permit(:reminder_type_id, :dd, :mm, :yyyy, :dofw, :moq, :begins, 
          :ends, :is_active, :reminderable_id, :reminderable_type, :user_id, :message, :date
          # , :contract_id, :akt_id
          )
    end
    
end
