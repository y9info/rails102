class TracksController < ApplicationController
  before_action :authenticate_user!, only:%i[ index show edit update destroy ]
  def index
    @customer = Customer.find(params[:customer_id])
    @tracks = Track.where(customer_id: @customer.id)

  end
  
  def new
    @customer = Customer.find(params[:customer_id])
    @track = Track.new
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @track = @customer.tracks.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @customer.user = current_user
    @track = Track.new(track_params)
    @track.customer = @customer

    if @track.save
      redirect_to customer_track_path(@customer,@track)
    else
      render :new
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @track = @customer.tracks.find(params[:id])
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to customer_track_path, notice: "更新客户信息成功！" }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @customer = Customer.find(params[:customer_id])
    @track = Track.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @track = @customer.tracks.find(params[:id])
    @track.destroy
    respond_to do |format|
      format.html { redirect_to customer_tracks_url, notice: "该条客户记录已经删除！" }
      format.json { head :no_content }
    end
  end

  private

  def track_params
    params.require(:track).permit(:title, :content, :date, :result)
  end

end
