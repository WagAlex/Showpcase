class ShopsController < ApplicationController
  respond_to :js, :html
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @shops = Shop.all
    if params[:search].present?
      @shops = Shop.near(params[:search], 1)
    else
      @shops = Shop.all
    end

    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.json({ title: shop.name })
#     marker.picture({
#             "url" => ,
#             "width" =>  32,
#             "height" => 32})
      marker.infowindow render_to_string(:partial => "/shops/map_box", locals: {shop: shop})
    end
  end

  def user_index
    @shops = current_user.shops
  end

  def show
    @booking = @shop.bookings.build
  end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    authorize @shop
    @shop.save
    @shop.pictures.create(picture_params) if picture_params[:file]
    respond_with do |format|
      format.js
      format.html { redirect_to shop_path(@shop) }
    end
  end

  def update
    @shop.update!(shop_params)
    @shop.pictures.create(picture_params) if picture_params[:file]

    respond_with do |format|
      format.js
      format.html { redirect_to shop_path(@shop) }
    end
  end

  def destroy
    @shop.destroy!
    @shop.pictures.each do |picture|
      picture.destroy!
    end
    redirect_to shops_path
  end

  private

    def set_shop
      @shop = Shop.find(params[:id])
      authorize @shop
    end

    def picture_params
      params.require(:shop).permit(:file)
    end

    def shop_params
      params.require(:shop).permit(:name, :description, :street_address, :zipcode, :city, :user_id, :country, :price)
    end
end
