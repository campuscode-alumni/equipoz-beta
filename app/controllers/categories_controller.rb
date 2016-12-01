class CategoriesController < ApplicationController
  def new
    @category = Category.new
    Category.periods.each do |period|
      @category.category_amounts.build(rental_period: period)
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :category_amounts_attributes => [:rental_period, :amount])
  end
end
