class ItemsController < ApplicationController
  include ItemsHelper

  before_filter :require_user, :only => [:create, :new, :destroy, :comment]
  before_filter :setup_coordinate, :only => [:nearby, :index]

  def nearby
    # TODO remember to remove this
    headers['Access-Control-Allow-Origin'] = "*"

    if has_coord?
      distance = params["distance"].to_f if params["distance"]
      distance = 5.0 if distance == nil || distance > 1000 # proper limitation here
      @items = Item.near(@coord, distance, :units => :km)
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
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @item, :status => :unprocessable_entity }
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

  def comment
    @item = Item.find(params[:id])
    @comment = @item.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @item, notice: "Comment posted" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Comment failed", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def interested_in
    @item = Item.find(params[:id])
    i = @item.interests.build(:user_id => current_user.id)
    if  i.save
      respond_to do |format|
        format.html { redirect_to @item, notice: "Interest submitted" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Interest NOT submitted", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def not_interested_in
    @item = Item.find(params[:id])
    if (i = @item.interests.find_by_user_id(current_user.id)) && i.destroy
      respond_to do |format|
        format.html { redirect_to @item, notice: "Interest removed" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Interest NOT removed", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def bookmark
    @item = Item.find(params[:id])
    bookmark = @item.bookmarks.build(:user_id => current_user.id)
    if bookmark.save
      respond_to do |format|
        format.html { redirect_to @item, notice: "Bookmark submitted" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Bookmark NOT submitted", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def un_bookmark
    @item = Item.find(params[:id])
    if (bookmark = @item.bookmarks.find_by_user_id(current_user.id)) && bookmark.destroy
      respond_to do |format|
        format.html { redirect_to @item, notice: "Bookmark removed" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Bookmark NOT removed", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def new_pm
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def send_pm
    @item = Item.find(params[:id])
    item_pm = @item.item_pms.build(params[:item_pm])
    item_pm.sender = current_user
    if item_pm.save
      respond_to do |format|
        format.html { redirect_to @item, notice: "Message sent" }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to @item, notice: "Message failed to send", :status => :unprocessable_entity }
        format.json { render json: @item, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { render json: {:status => :ok} }
    end
  end

  private
  def setup_coordinate
    if params[:lat] && params[:lon]
      @coord = [params["lat"].to_f, params["lon"].to_f]
    end
  end
end
