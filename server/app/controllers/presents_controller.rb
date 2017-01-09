class PresentsController < ApplicationController
  before_action :authenticate_user!, except: [:api_index, :api_show]

  def index
    query = Present.order('updated_at DESC')
    if params[:query].present?
      query = query.where('label LIKE ?', "%#{params[:query]}%")
    end
    @presents = query.all
  end

  def api_index
    query = Present.order('updated_at DESC')
    # Nested if ensures that the query always hits an index.
    if params[:sex].present?
      query = query.where(sex: params[:sex])
      if params[:age].present?
        query = query.where('age_from >= ?', params[:age]).where('age_to <= ?', params[:age])
      end
    end
    render json: query.all
  end

  def api_show
    @present = Present.eager_load(:present_stores).find(params[:id])
    render json: @present.to_json(include: [:present_stores])
  end

  def new
    @present = Present.new
    @holidays = Holiday.all
  end

  def create
    t = Present.transaction do
      present = Present.create(present_params)
      present.present_stores.create(present_stores_params)
      present.holidays << Holiday.where(id: params[:holidays]).all
    end
    if t
      redirect_to presents_path
    end
  end

  def edit
    @present = Present.eager_load(:holidays).find(params[:id])
    @holidays = Holiday.all
  end

  def update
    present = Present.find(params[:id])
    t = Present.transaction do
      present.update(present_params)
      # Crappy way to do this but I really don't have time to spend applying proper solutions on this project.
      present.present_stores.delete_all
      present.present_stores.create(present_stores_params)
      # Crappy again
      present.holidays.delete_all
      present.holidays << Holiday.where(id: params[:holidays]).all
    end
    if t
      redirect_to presents_path
    end
  end

  def destroy
    Present.destroy(params[:id])
    redirect_to presents_path
  end

  private

  def present_params
    params.permit(:label, :description, :sex, :age_from, :age_to)
  end

  def present_stores_params
    params.permit(present_stores: [:name, :url, :price])[:present_stores]
  end
end
