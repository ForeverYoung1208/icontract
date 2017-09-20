class AktsController < ApplicationController
  before_action :set_akt, only: [:show, :edit, :update, :destroy, :check_reminders]
  before_action :set_akts, only: [:index, :all, :mine]

  # GET /akts
  # GET /akts.json
  def index

    session[:akts_list_type]||= {"all" => true}
    if session[:akts_list_type]["mine"]
      redirect_to mine_akts_path and return
    elsif session[:akts_list_type]["all"] 
      redirect_to all_akts_path and return
    else
      raise Exception.new('Error with akts list')
    end


    # @list_type = {all: true}    
  end


  def all
    session[:akts_list_type] = {"all" => true}
    @list_type = session[:akts_list_type]

    render 'index'
  end

  def mine

    #I think in future akt will have its own responsible user    
    #look also at akt.rb
    @akts = @akts.where(:'contracts.responsible_user_id' => session[:current_user_id])

    session[:akts_list_type] = {"mine" => true}
    @list_type = session[:akts_list_type]    
    render 'index'
  end


  # GET /akts/1
  # GET /akts/1.json
  def show
  end

  # GET /akts/new
  def new
    @akt = Akt.new
  end

  # GET /akts/1/edit
  def edit
  end

  # POST /akts
  # POST /akts.json
  def create
    @akt = Akt.new(akt_params)

    respond_to do |format|
      if @akt.save
        format.html { redirect_to @akt, notice: 'Akt was successfully created.' }
        format.json { render :show, status: :created, location: @akt }
      else
        format.html { render :new }
        format.json { render json: @akt.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST  /contract/1/check_reminders
  def check_reminders
    @akt.check_reminders(params[:date])
    redirect_to events_path, notice: "events for akt.id = #{@akt.id} created"

  end

  def check_all_reminders
    scanned_akts_ids = ''

    Akt.all.each_with_index do |akt,i|
      akt.check_reminders(params[:date])

      i==0 ? scanned_akts_ids+=akt.id.to_s : scanned_akts_ids+=', '+akt.id.to_s
      
    end
    redirect_to events_path, notice: "events for akt.id = #{scanned_akts_ids} created (or already exists)"

  end

  # PATCH/PUT /akts/1
  # PATCH/PUT /akts/1.json
  def update
    respond_to do |format|
      if @akt.update(akt_params)
        format.html { redirect_to @akt, notice: 'Akt was successfully updated.' }
        format.json { render :show, status: :ok, location: @akt }
      else
        format.html { render :edit }
        format.json { render json: @akt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /akts/1
  # DELETE /akts/1.json
  def destroy
    @akt.destroy
    respond_to do |format|
      format.html { redirect_to akts_url, notice: 'Akt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_akt
      @akt = Akt.find(params[:id])
    end

    def set_akts
      @akts = Akt.all.includes(:contract).where(:'contracts.responsible_user_id' => @current_user.allowed_users_ids)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def akt_params
      params.require(:akt).permit(:contract_id, :from_date, :sum, :scan_path, :doc_path, :is_signed, :is_deleted, :is_taken_as_original)
    end
end
