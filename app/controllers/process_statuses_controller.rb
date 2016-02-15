class ProcessStatusesController < ApplicationController
  before_action :set_process_status, only: [:show, :edit, :update, :destroy]

  # GET /process_statuses
  # GET /process_statuses.json
  def index
    @process_statuses = ProcessStatus.all
  end

  # GET /process_statuses/1
  # GET /process_statuses/1.json
  def show
  end

  # GET /process_statuses/new
  def new
    @process_status = ProcessStatus.new
  end

  # GET /process_statuses/1/edit
  def edit
  end

  # POST /process_statuses
  # POST /process_statuses.json
  def create
    @process_status = ProcessStatus.new(process_status_params)

    respond_to do |format|
      if @process_status.save
        format.html { redirect_to @process_status, notice: 'Process status was successfully created.' }
        format.json { render :show, status: :created, location: @process_status }
      else
        format.html { render :new }
        format.json { render json: @process_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_statuses/1
  # PATCH/PUT /process_statuses/1.json
  def update
    respond_to do |format|
      if @process_status.update(process_status_params)
        format.html { redirect_to @process_status, notice: 'Process status was successfully updated.' }
        format.json { render :show, status: :ok, location: @process_status }
      else
        format.html { render :edit }
        format.json { render json: @process_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_statuses/1
  # DELETE /process_statuses/1.json
  def destroy
    @process_status.destroy
    respond_to do |format|
      format.html { redirect_to process_statuses_url, notice: 'Process status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_status
      @process_status = ProcessStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def process_status_params
      params.require(:process_status).permit(:process_status)
    end
end
