class EquipmentController < ApplicationController
	
  def new
    @equipment = Equipment.new
	end

  def create

    equipment = Equipment.create(equipment_params)
    redirect_to equipment_path(equipment)

  end

  def show
    @equipment = Equipment.find(params[:id])
  end

private

  def equipment_params
    params.require(:equipment).permit(
      :category, 
      :serial_number,
      :acquisition_date,
      :replacement_value,
      :usage_limit,
      :description )
  end

end
 