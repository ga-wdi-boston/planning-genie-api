# frozen_string_literal: true

class DeliveriesController < OpenReadController
  before_action :set_delivery, only: `%i(show update destroy)`

  # GET /deliveries
  def index
    @deliveries = if params[:user_id]
                    User.find(params[:user_id]).deliveries
                  else
                    Delivery.all
                  end

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

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def delivery_params
    params.require(:delivery).permit(:material_id,
                                     :user_id,
                                     :status,
                                     :cohort,
                                     :due_date)
  end
end
