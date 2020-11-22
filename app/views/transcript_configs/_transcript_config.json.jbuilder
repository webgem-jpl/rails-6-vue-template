<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> cf5e129... scaffold: TranscriptionOption
json.extract! transcript_config, :id, :name, :config, :created_at, :updated_at
json.url transcript_config_url(transcript_config, format: :json)
