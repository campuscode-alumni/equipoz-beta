class ContractsController < ApplicationController
  before_action :set_attibutes, only: [:new]

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
      @contract.equipment.update_all(available: false)
      redirect_to @contract
    else
      set_attibutes

      flash.now[:error] = 'Não foi possível criar contrato'
      render :new
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(
      :customer_id, :rental_period, :delivery_address, :contact,
      :payment_method, :amount, :discount, :total_amount, :finished,
      equipment_ids: []
    )
  end

  def set_attibutes
    @equipment = Equipment.where(available: true)
  end
end
