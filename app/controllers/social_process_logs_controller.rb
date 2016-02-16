class SocialProcessLogsController  < Api::V1::BaseController
  before_action :set_social_process_log, only: [:show, :edit, :update, :destroy]

  # GET /social_process_logs
  # GET /social_process_logs.json
   
  def index
    
    @social_process_logs = SocialProcessLog.getstatus(params[:source_social_id])
    if(params[:source_social_id] != '')
     ihash = {}
     ihash[:statuscode] = @social_process_logs
     render json: ihash , status: :ok
    end 
  end

  # GET /social_process_logs/1
  # GET /social_process_logs/1.json
  def show
  end

  # GET /social_process_logs/new
  def new
    @social_process_log = SocialProcessLog.new
  end

  # GET /social_process_logs/1/edit
  def edit
  end

  # POST /social_process_logs
  # POST /social_process_logs.json
  def create
      @changedParams = social_process_log_params
      if @changedParams[:process_status_id]
       @logger_sp1 = ProcessStatus.find_by_process_status(@changedParams[:process_status_id]) 
       @changedParams[:process_status_id] =  @logger_sp1.id  
      end  
    @social_process_log = SocialProcessLog.new(@changedParams)
       

    respond_to do |format|
      if @social_process_log.save                                                          
        format.html { redirect_to @social_process_log, notice: 'Social process log was successfully created.' }
        format.json { render :show, status: :created, location: @social_process_log }
      else
        format.html { render :new }
        format.json { render json: @social_process_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_process_logs/1
  # PATCH/PUT /social_process_logs/1.json
  def update
    respond_to do |format|
      @changedParams = social_process_log_params
      if @changedParams[:process_status_id]
       @logger_sp1 = ProcessStatus.find_by_process_status(@changedParams[:process_status_id]) 
       @changedParams[:process_status_id] =  @logger_sp1.id  
      end   
      if @social_process_log.update(@changedParams)

        format.html { redirect_to @social_process_log, notice: 'Social process log was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_process_log }
      else
        format.html { render :edit }
        format.json { render json: @social_process_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_process_logs/1
  # DELETE /social_process_logs/1.json
  def destroy
    @social_process_log.destroy
    respond_to do |format|
      format.html { redirect_to social_process_logs_url, notice: 'Social process log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_process_log
      @social_process_log = SocialProcessLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_process_log_params
      params.require(:social_process_log).permit(:project_id, :user_id, :source_social_id, :process_status_id)
    end
end
