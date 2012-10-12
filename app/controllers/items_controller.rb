class ItemsController < ApplicationController
  before_filter :require_user, :only => [:create, :new, :destroy]

  def nearby
    # TODO remember to remove this
    headers['Access-Control-Allow-Origin'] = "*"
    if params[:lat] && params[:lon]
      coord = [params["lat"].to_f, params["lon"].to_f]
      distance = params["distance"].to_f if params["distance"]
      distance = 50.0 if distance == nil || distance > 1000 # proper limitation here
      @items = Item.near(coord, distance, :units => :km)
    else
      @items = Item.find(:all)  
    end

    respond_to do |format|
      format.html
      format.json { render :index }
    end
  end

  def index
    @items = Item.find(:all)

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items/create
  def create
    @item = Item.new(params[:item])
    @item.owner_id = current_user.id

    if @item.save
      respond_to do |format|
        format.html { redirect_to @item, notice: "Item created" }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @item }
      end

    end
  end

  # GET /items/:id
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { render json: {:status => :ok} }
    end
  end
end
