class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories
  def index
    @categories = current_user.categories.includes(:category_payments)
    @totals = @categories.map do |category|
      category.category_payments.reduce(0) { |sum, num| sum + num.payment.amount }
    end
  end

  # GET /categories/1
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories
  def create
    @category = Category.new(category_params)
    @category.author = current_user

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
