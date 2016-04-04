class ProjectOntologiesController < Api::V1::BaseController
  before_action :set_project_ontology, only: [:show, :edit, :update, :destroy]

  # GET /project_ontologies
  # GET /project_ontologies.json
  def index
    @project_ontologies = ProjectOntology.projectOntologies(params[:project_id])
  end

  # GET /project_ontologies/1
  # GET /project_ontologies/1.json
  def show
  end

  # GET /project_ontologies/new
  def new
    @project_ontology = ProjectOntology.new
  end

  # GET /project_ontologies/1/edit
  def edit
  end

  # POST /project_ontologies
  # POST /project_ontologies.json
  def create
    @project_ontology = ProjectOntology.new(project_ontology_params)

    respond_to do |format|
      if @project_ontology.save
        format.html { redirect_to @project_ontology, notice: 'Project ontology was successfully created.' }
        format.json { render :show, status: :created, location: @project_ontology }
      else
        format.html { render :new }
        format.json { render json: @project_ontology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_ontologies/1
  # PATCH/PUT /project_ontologies/1.json
  def update
    respond_to do |format|
      if @project_ontology.update(project_ontology_params)
        format.html { redirect_to @project_ontology, notice: 'Project ontology was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_ontology }
      else
        format.html { render :edit }
        format.json { render json: @project_ontology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_ontologies/1
  # DELETE /project_ontologies/1.json
  def destroy
    @project_ontology.destroy
    respond_to do |format|
      format.html { redirect_to project_ontologies_url, notice: 'Project ontology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_ontology
      @project_ontology = ProjectOntology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_ontology_params
      params.require(:project_ontology).permit(:ontology_id, :project_id, :user_id, :taxonomies)
    end
end
