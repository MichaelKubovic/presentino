class HolidaysController < ApplicationController
  before_action :authenticate_user!, except: [:api_index]

  def index
    @holidays = Holiday.all
  end

  def api_index
  end

  def show
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      redirect_to holidays_path
    else
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def update
    @holiday = Holiday.find(params[:id])
    @holiday.attributes = holiday_params
    if @holiday.save
      redirect_to holidays_path
    else
    end
  end

  def destroy
    redirect_to holidays_path
  end

  private

  def holiday_params
    params.permit(:label, :date_from, :date_to)
  end
end
