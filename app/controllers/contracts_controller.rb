class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :check_reminders]

  before_action :set_contracts, only: [:index, :all, :mine]


  # GET /contracts
  # GET /contracts.json
  def index
    session[:contracts_list_type]||= {"all" => true}
    if session[:contracts_list_type]["mine"]
      redirect_to mine_contracts_path and return
    elsif session[:contracts_list_type]["all"] 
      redirect_to all_contracts_path and return
    else
      raise Exception.new('Error with contracts list')
    end

  end

  def all
    session[:contracts_list_type] = {"all" => true}

    @list_type = session[:contracts_list_type]

    render 'index'
  end

  def mine
    @contracts = @contracts.where("responsible_user_id = ?", session[:current_user_id])

    session[:contracts_list_type] = {"mine" => true}
    @list_type = session[:contracts_list_type]

    render 'index'
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new

    prepare_form_data

  end

  # GET /contracts/1/edit
  def edit
    prepare_form_data

  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)


    respond_to do |format|
      if @contract.save
        format.html { redirect_to edit_contract_path(@contract), notice: 'Договір створено.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html do
          prepare_form_data
          render :new
        end
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST  /contract/1/check_reminders
  def check_reminders
    @contract.check_reminders(params[:date])
    redirect_to events_path, notice: "events for contract.id = #{@contract.id} created"

  end

  def check_all_reminders
    scanned_contracts_ids = ''

    Contract.all.each_with_index do |contract,i|
      contract.check_reminders(params[:date])

      i==0 ? scanned_contracts_ids+=contract.id.to_s : scanned_contracts_ids+=', '+contract.id.to_s
      
    end
    redirect_to events_path, notice: "events for contract.id = #{scanned_contracts_ids} created (or already exists)"

  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to edit_contract_path(@contract), notice: 'Договір збережено' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html do
          prepare_form_data
          render :edit
        end
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    respond_to do |format|
      if @contract.update(deleted_at: DateTime.now)
      # @contract.destroy
        format.html { redirect_to contracts_url, notice: 'Договір видалений' }
        format.json { head :no_content }
      else
        format.html { redirect_to contracts_url, notice: "Помилка видляння. Договір не видалений #{@contract.errors}" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
      @contract.from_date = @contract.from_date.strftime("%d.%m.%Y")
      @contract.to_date = @contract.to_date.strftime("%d.%m.%Y")
      
    end

    def set_contracts
      # @contracts = Contract.all.includes(:type)
      @contracts = Contract.notdeleted.where(responsible_user_id: @current_user.allowed_users_ids)
        .includes(:type)
        .includes(:responsible_user)
        .includes(:creator_user)
        .includes(:payer)
        .includes(:recipient)
        .includes(:reminders)
    end

    def prepare_form_data
      @types = Type.all
      @companies = Company.all
      @responsible_users = User.all_with_any_role
      @creator_users = [ @current_user ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:type_id, :name, :number, :sum, :from_date, 
        :to_date, :till, :payer_id, :recipient_id, :is_signed, :is_active,
        :responsible_user_id, :creator_user_id, {scanfiles: []}, {textfiles: []},
        :remove_scanfiles, :remove_textfiles, :sum_detail, :preferences, :is_taken_as_original
      )
    end


end
