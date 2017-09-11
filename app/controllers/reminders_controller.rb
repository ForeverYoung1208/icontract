class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.all
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @reminder_types = ReminderType.all
    contract = Contract.find( params[:contract_id] )

    @reminder = Reminder.new( reminderable: contract)

  end

  # GET /reminders/1/edit
  def edit
    @reminder_types = ReminderType.all
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        @reminder_types = ReminderType.all
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
        format.html { redirect_to @reminder, notice: 'Reminder was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:reminder_type_id, :dd, :mm, :yyyy, :dofw, :moq, :begins, :ends, :is_active, :reminderable_id, :reminderable_type)
    end
    # def new_reminder_params
    #   params.permit(:contract_id)
    # end
end
