class SourceSocialsController < ApplicationController
  before_action :set_source_social, only: [:show, :edit, :update, :destroy]

  # GET /source_socials
  # GET /source_socials.json
  def index
     @source_socials = SourceSocial.projectChannels(params[:project_id],params[:channel_id]) 
  end

  # GET /source_socials/1
  # GET /source_socials/1.json
  def show
  end

  # GET /source_socials/new
  def new
    @source_social = SourceSocial.new
  end

  # GET /source_socials/1/edit
  def edit
  end

  # POST /source_socials
  # POST /source_socials.json
  def create
    @source_social = SourceSocial.new(source_social_params)

    respond_to do |format|
      if @source_social.save
        format.html { redirect_to @source_social, notice: 'Source social was successfully created.' }
        format.json { render :show, status: :created, location: @source_social }
      else
        format.html { render :new }
        format.json { render json: @source_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_socials/1
  # PATCH/PUT /source_socials/1.json
  def update
    respond_to do |format|
      if @source_social.update(source_social_params)
        format.html { redirect_to @source_social, notice: 'Source social was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_social }
      else
        format.html { render :edit }
        format.json { render json: @source_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_socials/1
  # DELETE /source_socials/1.json
  def destroy
    @source_social.destroy
    respond_to do |format|
      format.html { redirect_to source_socials_url, notice: 'Source social was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_social
      @source_social = SourceSocial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_social_params
      params.require(:source_social).permit(:collection_name, :fb_like_page_id, :access_token, :fb_feed_limit, :consumer_key, :consumer_secret, :access_secret, :geo_lat, :geo_lon, :twitter_hastags, :instagram_start_time, :instagram_end_time, :instagram_tags, :project_id, :channel_id)
    end
end
