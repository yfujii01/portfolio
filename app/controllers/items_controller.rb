class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  before_action :no_login_redirect, only: [:new, :create, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    if current_user != nil
      @items = Item.all
    else
      @items = Item.where(public: true)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: '作成しました' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_url, notice: '更新しました' }
        # format.html { redirect_to @item, notice: '更新しました' }
        # format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private

  # 未ログイン時はrootページへ飛ばす
  def no_login_redirect
    if current_user == nil
      redirect_to root_url
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:title, :url, :overview, :detail, :public, :user_id)
  end
end
