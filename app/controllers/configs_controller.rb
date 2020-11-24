class ConfigsController < ApplicationController
  before_action :set_config, only: %i[show edit update destroy]

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
    render json: @configs
  end

  # GET /configs/1
  # GET /configs/1.json
  def show; end

  # GET /configs/new
  def new
    @config = Config.new
  end

  # GET /configs/1/edit
  def edit; end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(transcript_config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to @config, notice: 'Transcription config was successfully created.' }
        format.json { render :show, status: :created, location: @config }
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(transcript_config_params)
        format.html { redirect_to @config, notice: 'Transcription config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Transcription config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transcript_config
    @config = Config.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transcript_config_params
    params.require(:transcript_config).permit(:name, :config)
  end
end
