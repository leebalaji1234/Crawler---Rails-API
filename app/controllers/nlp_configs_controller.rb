class NlpConfigsController < Api::V1::BaseController
  before_action :set_nlp_config, only: [:show, :edit, :update, :destroy]

  # GET /nlp_configs
  # GET /nlp_configs.json
  def index
    @nlp_configs = NlpConfig.projectNlpConfigs(params[:project_id])
  end

  # GET /nlp_configs/1
  # GET /nlp_configs/1.json
  def show
  end

  # GET /nlp_configs/new
  def new
    @nlp_config = NlpConfig.new
  end

  # GET /nlp_configs/1/edit
  def edit
  end

  # POST /nlp_configs
  # POST /nlp_configs.json
  def create
    @nlp_config = NlpConfig.new(nlp_config_params)
 
    respond_to do |format|
      if @nlp_config.save
        format.html { redirect_to @nlp_config, notice: 'Nlp config was successfully created.' }
        format.json { render :show, status: :created, location: @nlp_config }
      else
        format.html { render :new }
        format.json { render json: @nlp_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nlp_configs/1
  # PATCH/PUT /nlp_configs/1.json
  def update
    respond_to do |format|
      if @nlp_config.update(nlp_config_params)
        format.html { redirect_to @nlp_config, notice: 'Nlp config was successfully updated.' }
        format.json { render :show, status: :ok, location: @nlp_config }
      else
        format.html { render :edit }
        format.json { render json: @nlp_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nlp_configs/1
  # DELETE /nlp_configs/1.json
  def destroy
    @nlp_config.destroy
    respond_to do |format|
      format.html { redirect_to nlp_configs_url, notice: 'Nlp config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nlp_config
      @nlp_config = NlpConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nlp_config_params
      params.require(:nlp_config).permit(:language, :lod, :general_annotations, :entities_extract, :opendata, :spotting_method, :linking_method, :disambiguation, :project_id)
    end
end
