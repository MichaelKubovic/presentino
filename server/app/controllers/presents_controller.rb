class PresentsController < ApplicationController
  before_action :authenticate_user!, except: [:api_index, :api_show]

  def index
  end

  def api_index
    @presents = Present.all
    render json: @presents
  end

  def api_show
    @present = Present.eager_load(:present_stores).find(params[:id])
    render json: @present.to_json(include: [:present_stores])
  end

  def new
    @present = Present.new
  end

  def store
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
