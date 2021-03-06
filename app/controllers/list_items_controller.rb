# frozen_string_literal: true

class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[show edit update destroy mark_read mark_removed]
  before_action :set_list, only: [:create]
  before_action :ensure_secure, except: %i[new index]

  # GET lists/1/list_items
  # GET lists/1/list_items.json
  def index
    @list_items = ListItem
                  .where(list: current_user.lists)
                  .order(read: :asc, removed: :asc, created_at: :desc)
    if params[:list_id].present?
      @list_items = @list_items.where(list_id: params[:list_id])
    end
  end

  # GET lists/1/list_items/1
  # GET lists/1/list_items/1.json
  def show; end

  # GET lists/1/list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET lists/1/list_items/1/edit
  def edit; end

  # POST lists/1/list_items
  # POST lists/1/list_items.json
  def create
    @list_item = ListItem.new(list_item_params)

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to @list_item, notice: 'List item was successfully created.' }
        format.json { render :show, status: :created, location: @list_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT lists/1/list_items/1
  # PATCH/PUT lists/1/list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to @list_item, notice: 'List item was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE lists/1/list_items/1
  # DELETE lists/1/list_items/1.json
  def destroy
    @list_item.destroy
    respond_to do |format|
      format.html { redirect_to list_items_url, notice: 'List item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  # PATCH/PUT lists/1/list_items/1/mark_read
  def mark_read
    @list_item.update(read: true, read_at: DateTime.now)
    respond_to do |format|
      format.html { redirect_to list_items_url, notice: 'List item was successfully marked read.' }
      format.json { head :no_content }
      format.js
    end
  end

  # PATCH/PUT lists/1/list_items/1/mark_removed
  def mark_removed
    @list_item.update(removed: true)
    respond_to do |format|
      format.html { redirect_to list_items_url, notice: 'List item was successfully marked removed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_item][:list_id])
  end

  def list_item_params
    params.require(:list_item).permit(:url, :description, :read, :read_at, :removed, :list_id)
  end

  def ensure_secure
    list = @list_item&.list || List.find(params[:list_item][:list_id])
    render file: 'public/401.html', status: :unauthorized unless list.user == current_user
  end
end
