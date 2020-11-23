class TranscriptOptionsController < ApplicationController
  before_action :set_transcript_option, only: %i[show edit update destroy]

  # GET /transcript_options
  # GET /transcript_options.json
  def index
    @transcript_options = TranscriptOption.all
    render json: @transcript_options
  end

  # GET /transcript_options/1
  # GET /transcript_options/1.json
  def show; end

  # GET /transcript_options/new
  def new
    @transcript_option = TranscriptOption.new
  end

  # GET /transcript_options/1/edit
  def edit; end

  # POST /transcript_options
  # POST /transcript_options.json
  def create
    @transcript_option = TranscriptOption.new(transcript_config_params)

    respond_to do |format|
      if @transcript_option.save
        format.html { redirect_to @transcript_option, notice: 'Transcription config was successfully created.' }
        format.json { render :show, status: :created, location: @transcript_option }
      else
        format.html { render :new }
        format.json { render json: @transcript_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcript_options/1
  # PATCH/PUT /transcript_options/1.json
  def update
    respond_to do |format|
      if @transcript_option.update(transcript_config_params)
        format.html { redirect_to @transcript_option, notice: 'Transcription config was successfully updated.' }
        format.json { render :show, status: :ok, location: @transcript_option }
      else
        format.html { render :edit }
        format.json { render json: @transcript_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcript_options/1
  # DELETE /transcript_options/1.json
  def destroy
    @transcript_option.destroy
    respond_to do |format|
      format.html { redirect_to transcript_options_url, notice: 'Transcription config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transcript_config
    @transcript_option = TranscriptOption.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transcript_config_params
    params.require(:transcript_config).permit(:name, :config)
  end
end
