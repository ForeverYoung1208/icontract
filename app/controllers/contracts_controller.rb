class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :check_reminders]

  before_action :set_contracts, only: [:index, :all, :mine]

  # GET /contracts
  # GET /contracts.json
  def index

  end

  def all
    @contracts = @contracts.where("responsible_user_id = ?", 1)
    render 'index'
  end

  def mine
    @contracts = @contracts.where("responsible_user_id = ?", 2)
    render 'index'
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @types = Type.all
    @companies = Company.all

  end

  # GET /contracts/1/edit
  def edit
    @types = Type.all
    @companies = Company.all

  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)
    @types = Type.all
    @companies = Company.all

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST  /contract/1/check_reminders
  def check_reminders
    @contract.check_reminders(params[:date])
    redirect_to events_path, notice: "events for contract.id = #{@contract.id} created"

  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
      
    end

    def set_contracts
      @contracts = Contract.all.includes(:type)
        .includes(:responsible_user)
        .includes(:creator_user)
        .includes(:payer)
        .includes(:recipient)
        .includes(:reminders)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:type_id, :name, :number, :sum, :from_date, 
        :to_date, :till, :payer_id, :recipient_id, :is_signed, :is_active, :is_deleted, 
        :responsible_user_id, :creator_user_id, {scanfiles: []})
    end

    def index_params
      params.permit(:listType)
    end
end
