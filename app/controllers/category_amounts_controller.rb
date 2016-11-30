class CategoryAmountsController < ApplicationController
  before_action :set_attributes, only: [:new]

  def new
    @category_amount = CategoryAmount.new
  end

  def create
    @category_amount = CategoryAmount.new(category_amount_params)

    if @category_amount.save
      redirect_to category_amount_path(@category_amount)
    else
      set_attributes
      flash.now[:errors] = 'não pode ficar em branco'
      render :new
    end
  end

  def show
    @category_amount = CategoryAmount.find(params[:id])
  end

  private

  def category_amount_params
    params.require(:category_amount).permit(
      :category_id,
      :rental_period,
      :amount
    )
  end

  def set_attributes
    @categories = Category.all
    @rental_periods = [1, 3, 5, 7, 15, 20, 30]
  end
end
