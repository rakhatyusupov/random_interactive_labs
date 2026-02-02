class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = Collection.recent.includes(:user, :tags)
  end

  def show
    authorize @collection
    @collection_items = @collection.collection_items.ordered
  end

  def new
    @collection = current_user.collections.build
    authorize @collection
  end

  def create
    @collection = current_user.collections.build(collection_params)
    authorize @collection

    if @collection.save
      redirect_to @collection, notice: "Collection was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @collection
  end

  def update
    authorize @collection

    if @collection.update(collection_params)
      redirect_to @collection, notice: "Collection was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @collection
    @collection.destroy
    redirect_to collections_url, notice: "Collection was successfully destroyed."
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description, :cover_image, tag_names: [])
  end
end
