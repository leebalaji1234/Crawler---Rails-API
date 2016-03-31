class WebProcessLogsController < Api::V1::BaseController
  before_action :set_web_process_log, only: [:show, :edit, :update, :destroy]

  # GET /web_process_logs
  # GET /web_process_logs.json
  def index
    @web_process_logs = WebProcessLog.all
  end

  # GET /web_process_logs/1
  # GET /web_process_logs/1.json
  def show
  end

  # GET /web_process_logs/new
  def new
    @web_process_log = WebProcessLog.new
  end

  # GET /web_process_logs/1/edit
  def edit
  end

  # POST /web_process_logs
  # POST /web_process_logs.json
  def create
     @changedParams = web_process_log_params
      if @changedParams[:process_status_id]
       @logger_sp1 = ProcessStatus.find_by_process_status(@changedParams[:process_status_id]) 
       @changedParams[:process_status_id] =  @logger_sp1.id  
      end  
    @web_process_log = WebProcessLog.new(@changedParams)
     

    respond_to do |format|
      if @web_process_log.save
        format.html { redirect_to @web_process_log, notice: 'Web process log was successfully created.' }
        format.json { render :show, status: :created, location: @web_process_log }
      else
        format.html { render :new }
        format.json { render json: @web_process_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_process_logs/1
  # PATCH/PUT /web_process_logs/1.json
  def update
    respond_to do |format|
       @changedParams = web_process_log_params
      if @changedParams[:process_status_id]
       @logger_sp1 = ProcessStatus.find_by_process_status(@changedParams[:process_status_id]) 
       @changedParams[:process_status_id] =  @logger_sp1.id  
      end   
      if @web_process_log.update(@changedParams) 
        format.html { redirect_to @web_process_log, notice: 'Web process log was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_process_log }
      else
        format.html { render :edit }
        format.json { render json: @web_process_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_process_logs/1
  # DELETE /web_process_logs/1.json
  def destroy
    @web_process_log.destroy
    respond_to do |format|
      format.html { redirect_to web_process_logs_url, notice: 'Web process log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_process_log
      @web_process_log = WebProcessLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_process_log_params
      params.require(:web_process_log).permit(:source_web_id, :process_status_id, :project_id, :user_id)
    end
end
