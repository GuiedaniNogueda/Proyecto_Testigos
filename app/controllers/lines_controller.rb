class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  def index
    @creative = Creative.find(params[:creative_id])
    @lines = @creative.lines
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  # GET /lines/new
  def new
    @order = Order.find(params[:order_id])
    @creative = Creative.find(params[:creative_id])
    @line = @creative.lines.new
    @lines = @creative.lines
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  # POST /lines.json
  def create
    @line = Line.new(line_params)
    @order = Order.find(params[:order_id])
    @creative = Creative.find(params[:creative_id])

    respond_to do |format|
      if @line.save
        
        @page = @creative.pages.new
        @page.creative_id = @creative.id
        @page.line_id = @line.id
        @page.save

        format.html { redirect_to new_order_creative_line_path(@order, @creative), notice: 'Line was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to lines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:line_number, :format_id, :start_date, :end_date)
    end
end
