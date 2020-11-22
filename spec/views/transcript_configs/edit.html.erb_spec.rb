<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> cf5e129... scaffold: TranscriptionOption
require 'rails_helper'

RSpec.describe 'transcript_configs/edit', type: :view do
  before(:each) do
    @transcript_config = assign(:transcript_config, TranscriptConfig.create!(
                                                      name: 'MyString',
                                                      config: 'MyText'
                                                    ))
  end

  it 'renders the edit transcript_config form' do
    render

    assert_select 'form[action=?][method=?]', transcript_config_path(@transcript_config), 'post' do
      assert_select 'input[name=?]', 'transcript_config[name]'

      assert_select 'textarea[name=?]', 'transcript_config[config]'
    end
  end
end
