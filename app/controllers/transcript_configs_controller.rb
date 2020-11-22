<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> cf5e129... scaffold: TranscriptionOption
class TranscriptConfigsController < ApplicationController
  before_action :set_transcript_config, only: %i[show edit update destroy]

  # GET /transcript_configs
  # GET /transcript_configs.json
  def index
    @transcript_configs = TranscriptConfig.all
  end

  # GET /transcript_configs/1
  # GET /transcript_configs/1.json
  def show; end

  # GET /transcript_configs/new
  def new
    @transcript_config = TranscriptConfig.new
  end

  # GET /transcript_configs/1/edit
  def edit; end

  # POST /transcript_configs
  # POST /transcript_configs.json
  def create
    @transcript_config = TranscriptConfig.new(transcript_config_params)

    respond_to do |format|
      if @transcript_config.save
        format.html { redirect_to @transcript_config, notice: 'Transcript config was successfully created.' }
        format.json { render :show, status: :created, location: @transcript_config }
      else
        format.html { render :new }
        format.json { render json: @transcript_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcript_configs/1
  # PATCH/PUT /transcript_configs/1.json
  def update
    respond_to do |format|
      if @transcript_config.update(transcript_config_params)
        format.html { redirect_to @transcript_config, notice: 'Transcript config was successfully updated.' }
        format.json { render :show, status: :ok, location: @transcript_config }
      else
        format.html { render :edit }
        format.json { render json: @transcript_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcript_configs/1
  # DELETE /transcript_configs/1.json
  def destroy
    @transcript_config.destroy
    respond_to do |format|
      format.html { redirect_to transcript_configs_url, notice: 'Transcript config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transcript_config
    @transcript_config = TranscriptConfig.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transcript_config_params
    params.require(:transcript_config).permit(:name, :config)
  end
end
