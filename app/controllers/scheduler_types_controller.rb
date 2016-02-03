class SchedulerTypesController < Api::V1::BaseController
  before_action :set_scheduler_type, only: [:show, :edit, :update, :destroy]

  # GET /scheduler_types
  # GET /scheduler_types.json
  def index
    @scheduler_types = SchedulerType.all
  end

  # GET /scheduler_types/1
  # GET /scheduler_types/1.json
  def show
  end

  # GET /scheduler_types/new
  def new
    @scheduler_type = SchedulerType.new
  end

  # GET /scheduler_types/1/edit
  def edit
  end

  # POST /scheduler_types
  # POST /scheduler_types.json
  def create
    @scheduler_type = SchedulerType.new(scheduler_type_params)

    respond_to do |format|
      if @scheduler_type.save
        format.html { redirect_to @scheduler_type, notice: 'Scheduler type was successfully created.' }
        format.json { render :show, status: :created, location: @scheduler_type }
      else
        format.html { render :new }
        format.json { render json: @scheduler_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduler_types/1
  # PATCH/PUT /scheduler_types/1.json
  def update
    respond_to do |format|
      if @scheduler_type.update(scheduler_type_params)
        format.html { redirect_to @scheduler_type, notice: 'Scheduler type was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduler_type }
      else
        format.html { render :edit }
        format.json { render json: @scheduler_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduler_types/1
  # DELETE /scheduler_types/1.json
  def destroy
    @scheduler_type.destroy
    respond_to do |format|
      format.html { redirect_to scheduler_types_url, notice: 'Scheduler type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduler_type
      @scheduler_type = SchedulerType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduler_type_params
      params.require(:scheduler_type).permit(:scheduler_name)
    end
end
