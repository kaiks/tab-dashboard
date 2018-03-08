class KnowledgeRepositoriesController < ApplicationController
  before_action :set_knowledge_repository, only: [:show, :edit, :update, :destroy]

  # GET /knowledge_repositories
  # GET /knowledge_repositories.json
  def index
    @knowledge_repositories = KnowledgeRepository.all
  end

  # GET /knowledge_repositories/1
  # GET /knowledge_repositories/1.json
  def show
  end

  # GET /knowledge_repositories/new
  def new
    @knowledge_repository = KnowledgeRepository.new
  end

  # GET /knowledge_repositories/1/edit
  def edit
  end

  # POST /knowledge_repositories
  # POST /knowledge_repositories.json
  def create
    @knowledge_repository = KnowledgeRepository.new(knowledge_repository_params)

    respond_to do |format|
      if @knowledge_repository.save
        format.html { redirect_to @knowledge_repository, notice: 'Knowledge repository was successfully created.' }
        format.json { render :show, status: :created, location: @knowledge_repository }
      else
        format.html { render :new }
        format.json { render json: @knowledge_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge_repositories/1
  # PATCH/PUT /knowledge_repositories/1.json
  def update
    respond_to do |format|
      if @knowledge_repository.update(knowledge_repository_params)
        format.html { redirect_to @knowledge_repository, notice: 'Knowledge repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledge_repository }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_repositories/1
  # DELETE /knowledge_repositories/1.json
  def destroy
    @knowledge_repository.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_repositories_url, notice: 'Knowledge repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_repository
      @knowledge_repository = KnowledgeRepository.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_repository_params
      params.require(:knowledge_repository).permit(:url, :description, :name)
    end
end
