# frozen_string_literal: true

class MaterialsController < OpenReadController
  before_action :set_material, only: [:update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all

    render json: @materials
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    render json: Material.find(params[:id])
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = current_user.materials.build(material_params)

    if @material.save
      render json: @material, status: :created
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    if @material.update(material_params)
      head :no_content
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy

    head :no_content
  end

  def set_material
    @material = current_user.materials.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:material_type, :name)
  end

  private :set_material, :material_params
end
