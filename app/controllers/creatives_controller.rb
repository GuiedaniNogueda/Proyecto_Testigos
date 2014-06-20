class CreativesController < ApplicationController
  before_action :set_creative, only: [:show, :edit, :update, :destroy]

  # GET /creatives
  # GET /creatives.json
  def index
    @order = Order.find(params[:order_id])
  end

  # GET /creatives/1
  # GET /creatives/1.json
  def show
  end

  # GET /creatives/new
  def new
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.new
  end

  # GET /creatives/1/edit
  def edit
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:id])
  end

  def url_options
    { order_id: params[:order_id] }.merge(super)    
  end

  # POST /creatives
  # POST /creatives.json
  def create
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.new(creative_params)

    if @creative.save
      redirect_to order_creatives_path
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /creatives/1
  # PATCH/PUT /creatives/1.json
  def update

    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:id])

    respond_to do |format|
      if @creative.update(creative_params)
        format.html { redirect_to order_creative_path(@creative), notice: 'Creative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1
  # DELETE /creatives/1.json
  def destroy

    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:id])

    @creative.destroy
    respond_to do |format|
      format.html { redirect_to order_creatives_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative
      @creative = Creative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_params
      params.require(:creative).permit(:creative_name, :order_id)
    end
end
