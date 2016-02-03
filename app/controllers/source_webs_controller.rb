class SourceWebsController < Api::V1::BaseController
  before_action :set_source_web, only: [:show, :edit, :update, :destroy]

  # GET /source_webs
  # GET /source_webs.json
  def index 
    @source_webs = SourceWeb.all 
  end

  # GET /source_webs/1
  # GET /source_webs/1.json
  def show
  end

  # GET /source_webs/new
  def new 
    @source_web = SourceWeb.new
  end

  # GET /source_webs/1/edit
  def edit
  end

  # POST /source_webs
  # POST /source_webs.json
  def create
    @source_web = SourceWeb.new(source_web_params)

    respond_to do |format|
      if @source_web.save
        format.html { redirect_to @source_web, notice: 'Source web was successfully created.' }
        format.json { render :show, status: :created, location: @source_web }
      else
        format.html { render :new }
        format.json { render json: @source_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_webs/1
  # PATCH/PUT /source_webs/1.json
  def update
    respond_to do |format|
      if @source_web.update(source_web_params)
        format.html { redirect_to @source_web, notice: 'Source web was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_web }
      else
        format.html { render :edit }
        format.json { render json: @source_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_webs/1
  # DELETE /source_webs/1.json
  def destroy
    @source_web.destroy
    respond_to do |format|
      format.html { redirect_to source_webs_url, notice: 'Source web was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_web
      @source_web = SourceWeb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_web_params
      params.require(:source_web).permit(:url_collection_name, :url_collection, :scheduler_type_id, :project_id)
    end
end
