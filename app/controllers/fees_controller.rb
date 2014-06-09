class FeesController < ApplicationController :include, ActionController::StrongParameters

  # before_filter :authenticate_user!
  # before_action only: [:show, :edit, :update, :destroty]
  before_filter only: [:show, :edit, :update, :destroty]

  def index
    @fees = Fee.all
  end

  def show
     @fee = Fee.find(params[:id])
  end

  def new
  	@fee = Fee.new
  end

  def edit
    @fee = Fee.find(params[:id])
  end

  def create
    @fee = Fee.new(fee_params)

    respond_to do |format|
      if @fee.save
        format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
        format.json { render :show, status: :created, location: @fee }
      else
        format.html { render :new }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fee.update(fee_params)
        format.html { redirect_to @fee, notice: 'Fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee }
      else
        format.html { render :edit }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to fees_url, notice: 'Fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fee
      @fee = Fee.find(params[:id])
    end

    def fee_params
      params.require(:fee).permit(:name, :amount)
    end
end