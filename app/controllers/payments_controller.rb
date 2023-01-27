class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments
  def index
    @payments = current_user.payments.select do |payment|
      payment.category_payments[0].category.id == params[:id].to_i
    end
    @total = @payments.reduce(0) { |sum, num| sum + num.amount }

    @category_id = params[:id]
    @category = Category.find(@category_id)
  end

  # GET /payments/1
  def show; end

  # GET /payments/new
  def new
    @payment = Payment.new
    @categories = current_user.categories.map { |category| [category.name, category.id] }
    @category_id = params[:id]
    # @category_page_path = transaction_index_path_url(id: params[:id])
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments
  def create
    @payment = Payment.new(name: payment_params[:name], amount: payment_params[:amount], author: current_user)
    @payment.save
    @selected_category = Category.find(payment_params[:category])
    @new_category_payment = CategoryPayment.new(payment: @payment, category: @selected_category)
    @new_category_payment.save

    if @payment.save && @new_category_payment.save
      redirect_to @selected_category, notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: 'Payment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
    redirect_to payments_url, notice: 'Payment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id, :category)
    # params.require(:payment).permit(:name, :amount)
  end
end
