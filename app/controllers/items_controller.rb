class ItemsController < ApplicationController
  before_filter :require_user, :only => [:create, :new, :destroy]

  def nearby
    @items = Item.find(:all)

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  def index
    @items = Item.find(:all)

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items/create
  def create
    @item = Item.create(params[:item])
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
      format.json { render json: @item }
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { render json: {:status => :ok} }
    end
  end
end
