class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  has_scope :with_name, as: :name
  has_scope :with_category, as: :category
  has_scope :with_option, as: :option
  has_scope :with_price, as: :price, using: %i[min max days], type: :hash, :default => [1]              
  has_scope :available, using: %i[start_date end_date], type: :hash
  
  # GET /items
  def index
    items = apply_scopes(Item).all
    paginate json: items.as_json, status: :ok
  end

  # GET /items/:id
  def show  
    render json: @item.as_json, status: :ok
  end

  # POST /items
  def create
    user = User.first
    item = user.items.new(item_params)
    if item.save
      render json: item.as_json, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /items/:id
  def update
    if item.update(item_params)
      head :no_content
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #DELETE /items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :owner, :category, :options => [])
  end

  def set_item
    @item = Item.find(params[:id])
  end 
end

