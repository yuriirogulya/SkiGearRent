class ItemsController < ApplicationController
  def index
    if params[:page]
      @items = Item.page(page).per(per_page)
      page_count = (Item.count / per_page.to_f).ceil
    else
      @items = Item.all
      page_count = 1
    end
    render json: JSON.pretty_generate(
      items: @items.as_json,
      meta: { pages: page_count, records: Item.count })
  end

  private

  def page
    @page ||= params[:page] || 1
  end

  def per_page
    @per_page ||= params[:per_page] || 5
  end
end
