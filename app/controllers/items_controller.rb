class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    items = Item.all 
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
    params.permit(:name, :description, :owner, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end 
end

