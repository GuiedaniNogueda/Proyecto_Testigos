class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])
    @image = @creative.images.new
  end

  # GET /images/1/edit
  def edit
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])
    @image = @creative.images.find(params[:id])
  end

  def url_options
    { order_id: params[:order_id], creative_id: params[:creative_id] }.merge(super)
  end

  # POST /images
  # POST /images.json
  def create

    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])

    @image = @creative.images.new(image_params)

    if @image.save
      redirect_to order_creative_images_path
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])
    @image = @creative.images.find(params[:id])

    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to order_creative_image_path(@image), notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @order = Order.find(params[:order_id])
    @creative = @order.creatives.find(params[:creative_id])
    @image = @creative.images.find(params[:id])


    @image.destroy
    respond_to do |format|
      format.html { redirect_to order_creative_images_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:file_id, :creative_id)
    end
end
