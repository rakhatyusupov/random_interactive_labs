class CollectionItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection
  before_action :set_collection_item, only: [:destroy]

  def create
    @collection_item = @collection.collection_items.build(collection_item_params)
    authorize @collection, :add_item?, policy_class: CollectionPolicy

    if @collection_item.save
      redirect_to @collection, notice: "Item added to collection."
    else
      redirect_to @collection, alert: "Failed to add item: #{@collection_item.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    authorize @collection, :remove_item?, policy_class: CollectionPolicy
    @collection_item.destroy
    redirect_to @collection, notice: "Item removed from collection."
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_collection_item
    @collection_item = @collection.collection_items.find(params[:id])
  end

  def collection_item_params
    params.require(:collection_item).permit(:item_type, :title, :url, :content, :file)
  end
end
