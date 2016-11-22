class EquipmentController < ApplicationController

  def new
		@categories = Category.all
    @equipment = Equipment.new
	end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      flash.now[:error] = 'Não foi possível cadastrar equipamento'
      render :new

    end

  end

  def show
    @equipment = Equipment.find(params[:id])
  end

private

  def equipment_params
    params.require(:equipment).permit(
      :category_id,
      :serial_number,
      :acquisition_date,
      :replacement_value,
      :usage_limit,
      :description )
  end

end
