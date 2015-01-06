class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stores = Store.all
    respond_with(@stores)
  end

  def show
    respond_with(@store)
  end

  def new
    @store = Store.new
    respond_with(@store)
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    @store.save
    respond_with(@store)
  end

  def update
    @store.update(store_params)
    respond_with(@store)
  end

  def destroy
    @store.destroy
    respond_with(@store)
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :city_id, :facebook, :twitter)
    end
end
