class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    if params[:page]
      @items = Item.page(page).per(per_page)
      #page_count = (Item.count / per_page.to_f).ceil
    else
      @items = Item.all
      #page_count = 1
    end
    #meta = { pages: page_count, records: Item.count }  
    json_response(@items)
  end

  # GET /items/:id
  def show  
    json_response(@item)
  end

  # POST /items
  def create
    @user = User.first
    @item = @user.items.create!(item_params)
    json_response(@item, :created)
  end

  # PUT /items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  #DELETE /items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :owner)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def page
    @page ||= params[:page] || 1
  end

  def per_page
    @per_page ||= params[:per_page] || 5
  end
end

