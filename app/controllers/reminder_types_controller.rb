class ReminderTypesController < ApplicationController
  before_action :set_reminder_type, only: [:show, :edit, :update, :destroy]

  # GET /reminder_types
  # GET /reminder_types.json
  def index
    @reminder_types = ReminderType.all
  end

  # GET /reminder_types/1
  # GET /reminder_types/1.json
  def show
  end

  # GET /reminder_types/new
  def new
    @reminder_type = ReminderType.new
  end

  # GET /reminder_types/1/edit
  def edit
  end

  # POST /reminder_types
  # POST /reminder_types.json
  def create
    @reminder_type = ReminderType.new(reminder_type_params)

    respond_to do |format|
      if @reminder_type.save
        format.html { redirect_to @reminder_type, notice: 'Reminder type was successfully created.' }
        format.json { render :show, status: :created, location: @reminder_type }
      else
        format.html { render :new }
        format.json { render json: @reminder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminder_types/1
  # PATCH/PUT /reminder_types/1.json
  def update
    respond_to do |format|
      if @reminder_type.update(reminder_type_params)
        format.html { redirect_to @reminder_type, notice: 'Reminder type was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder_type }
      else
        format.html { render :edit }
        format.json { render json: @reminder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_types/1
  # DELETE /reminder_types/1.json
  def destroy
    @reminder_type.destroy
    respond_to do |format|
      format.html { redirect_to reminder_types_url, notice: 'Reminder type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder_type
      @reminder_type = ReminderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_type_params
      params.require(:reminder_type).permit(:name, :description)
    end
end
