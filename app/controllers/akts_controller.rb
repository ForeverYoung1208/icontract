class AktsController < ApplicationController
  before_action :set_akt, only: [:show, :edit, :update, :destroy]
  before_action :set_akts, only: [:index, :all, :mine]

  # GET /akts
  # GET /akts.json
  def index
    @list_type = {all: true}    
  end


  def all
    # allowed_users_ids = User.all.pluck(:id)
    # @contracts = @contracts.where(responsible_user_id: allowed_users_ids)
    @list_type = {all: true}
    render '_akts_table', layout: false
  end

  def mine
    # @contracts = @akts.where("responsible_user_id = ?", session[:current_user_id])
    @list_type = {mine: true}    
    render '_akts_table', layout: false
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
      @akts = Akt.all.includes(:contract)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def akt_params
      params.require(:akt).permit(:contract_id, :from_date, :sum, :scan_path, :doc_path, :is_signed, :is_deleted, :is_taken_as_original)
    end
end
