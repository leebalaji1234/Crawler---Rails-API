class ProjectDomainsController < Api::V1::BaseController
  before_action :set_project_domain, only: [:show, :edit, :update, :destroy]

  # GET /project_domains
  # GET /project_domains.json
  def index
    @project_domains = ProjectDomain.projectDomains(params[:project_id])
  end
  # GET /project_domains/1
  # GET /project_domains/1.json
  def show
  end

  # GET /project_domains/new
  def new
    @project_domain = ProjectDomain.new
  end

  # GET /project_domains/1/edit
  def edit
  end

  # POST /project_domains
  # POST /project_domains.json
  def create
    @project_domain = ProjectDomain.new(project_domain_params)

    respond_to do |format|
      if @project_domain.save
        format.html { redirect_to @project_domain, notice: 'Project domain was successfully created.' }
        format.json { render :show, status: :created, location: @project_domain }
      else
        format.html { render :new }
        format.json { render json: @project_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_domains/1
  # PATCH/PUT /project_domains/1.json
  def update
    respond_to do |format|
      if @project_domain.update(project_domain_params)
        format.html { redirect_to @project_domain, notice: 'Project domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_domain }
      else
        format.html { render :edit }
        format.json { render json: @project_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_domains/1
  # DELETE /project_domains/1.json
  def destroy
    @project_domain.destroy
    respond_to do |format|
      format.html { redirect_to project_domains_url, notice: 'Project domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_domain
      @project_domain = ProjectDomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_domain_params
      params.require(:project_domain).permit(:domain_id, :project_id, :user_id)
    end
end
