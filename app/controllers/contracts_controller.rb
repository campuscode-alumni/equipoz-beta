class ContractsController < ApplicationController
  before_action :get_contract, only: [:show, :update]
  before_action :get_attibutes, only: [:new]

  def index
    @contracts = Contract.all
  end

  def new
    @contract = Contract.new
    @customer = Customer.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      get_attibutes

      flash.now[:error] = 'Não foi possível criar contrato'
      render :new
    end
  end

  def show
  end

  def update
    if @contract.update(contract_params)
      redirect_to contracts_path
    end
  end

  private
    def contract_params
      params.require(:contract).permit(:customer_id, :rental_period, :delivery_address,
        :contact, :payment_method, :amount, :discount, :total_amount, :finished, equipment_ids: [])
    end

    def get_contract
      @contract = Contract.find(params[:id])
    end
    def get_attibutes
      @equipment = Equipment.where(available: true)
    end
end
