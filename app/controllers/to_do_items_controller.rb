class ToDoItemsController < ApplicationController
  before_action :set_to_do_item, only: [:show, :edit, :update, :destroy, :mark_done, :mark_removed]
  before_action :ensure_secure, except: [:new, :index, :create]

  # GET /to_do_items
  # GET /to_do_items.json
  def index
    @to_do_items = current_user.to_do_items.all
  end

  # GET /to_do_items/1
  # GET /to_do_items/1.json
  def show
  end

  # GET /to_do_items/new
  def new
    @to_do_item = ToDoItem.new
  end

  # GET /to_do_items/1/edit
  def edit
  end

  # POST /to_do_items
  # POST /to_do_items.json
  def create
    @to_do_item = ToDoItem.new(to_do_item_params)
    @to_do_item.user_id = current_user.id

    respond_to do |format|
      if @to_do_item.save
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully created.' }
        format.json { render :show, status: :created, location: @to_do_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /to_do_items/1
  # PATCH/PUT /to_do_items/1.json
  def update
    respond_to do |format|
      if @to_do_item.update(to_do_item_params)
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do_item }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT to_do_items/1/mark_done
  def mark_done
    @to_do_item.update(done: true)
    respond_to do |format|
      format.html { redirect_to to_do_items_url, notice: 'To do item was successfully marked done.' }
      format.json { head :no_content }
      format.js
    end
  end

  # PATCH/PUT to_do_items/1/mark_removed
  def mark_removed
    @to_do_item.update(removed: true)
    respond_to do |format|
      format.html { redirect_to to_do_items_url, notice: 'To do item was successfully marked removed.' }
      format.json { head :no_content }
      format.js
    end
  end


  # DELETE /to_do_items/1
  # DELETE /to_do_items/1.json
  def destroy
    @to_do_item.destroy
    respond_to do |format|
      format.html { redirect_to to_do_items_url, notice: 'To do item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_to_do_item
    @to_do_item = ToDoItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def to_do_item_params
    params.require(:to_do_item).permit(:content, :done, :removed, :done_at, :description, :valid_from, :deadline)
  end

  def ensure_secure
    render file: "public/401.html", status: :unauthorized unless @to_do_item.user == current_user
  end
end
