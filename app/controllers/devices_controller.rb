class DevicesController < ApplicationController
  before_action :set_device, only: [:show]

  def index
    @devices = Device.order('id DESC')
  end

  def show; end;

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:success] = 'Device was created'
      redirect_to devices_path
    else
      render :new
    end
  end

  private

  def device_params
    params.require(:device).permit(:name, :imei, :sim, :location, :manager)
  end

  def set_device
    @device = Device.find_by_id(params[:id])
    if @device.nil?
      flash[:error] = 'Invalid Device id'
      redirect_to devices_path
    end
  end
end