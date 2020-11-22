<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> cf5e129... scaffold: TranscriptionOption
require 'rails_helper'

RSpec.describe 'transcript_configs/show', type: :view do
  before(:each) do
    @transcript_config = assign(:transcript_config, TranscriptConfig.create!(
                                                      name: 'Name',
                                                      config: 'MyText'
                                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
