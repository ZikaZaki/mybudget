class CategoryPaymentsController < ApplicationController
  before_action :set_category_payment, only: %i[show edit update destroy]

  # GET /category_payments
  def index
    @category_payments = CategoryPayment.all.order(created_at: :desc)
      .includes(:category, :payment).where(payments: { author_id: current_user.id })
  end

  # GET /category_payments/1
  def show; end

  # GET /category_payments/new
  def new
    @category_payment = CategoryPayment.new
  end

  # GET /category_payments/1/edit
  def edit; end

  # POST /category_payments
  def create
    @category_payment = CategoryPayment.new(category_payment_params)

    if @category_payment.save
      redirect_to @category_payment, notice: 'Category payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category_payments/1
  def update
    if @category_payment.update(category_payment_params)
      redirect_to @category_payment, notice: 'Category payment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /category_payments/1
  def destroy
    @category_payment.destroy
    redirect_to category_payments_url, notice: 'Category payment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_payment
    @category_payment = CategoryPayment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_payment_params
    params.require(:category_payment).permit(:category_id, :payment_id)
  end
end
