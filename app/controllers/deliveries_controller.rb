# frozen_string_literal: true

class DeliveriesController < OpenReadController
  before_action :set_delivery, only: [:show, :update, :destroy]

  # GET /deliveries
  def index
    @deliveries = set_deliveries

    render json: @deliveries
  end

  # GET /deliveries/1
  def show
    render json: @delivery
  end

  # POST /deliveries
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render json: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def delivery_params
    params.require(:delivery).permit(:material_id,
                                     :user_id,
                                     :status,
                                     :cohort,
                                     :due_date)
  end

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def set_deliveries
    if params[:user_id] && params[:all] == true
      set_future_user_deliveries
    elsif params[:user_id]
      set_user_deliveries
    elsif params[:all] == 'true'
      Delivery.all
    else
      set_future_deliveries
    end
  end

  def next_ninety
    { due_date: Date.today..(Date.today + 90) }
  end

  # next 50 days of deliveries
  def set_future_deliveries
    Delivery.where next_ninety
  end

  def set_user_deliveries
    Delivery.where user_id: params[:user_id]
  end

  def set_future_user_deliveries
    set_user_deliveries.where next_ninety
  end

  # def set deliveries where it gets passed the params hash? 0-2 args?
  # set deliveries then says 0 args? all future deliveries,
  # 1 arg? which arg? -> filter based on that
  # 2 args? both
end
