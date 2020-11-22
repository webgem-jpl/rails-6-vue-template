require 'rails_helper'

RSpec.describe 'transcript_configs/new', type: :view do
  before(:each) do
    assign(:transcript_config, TranscriptConfig.new(
                                 name: 'MyString',
                                 config: 'MyText'
                               ))
  end

  it 'renders new transcript_config form' do
    render

    assert_select 'form[action=?][method=?]', transcript_configs_path, 'post' do
      assert_select 'input[name=?]', 'transcript_config[name]'

      assert_select 'textarea[name=?]', 'transcript_config[config]'
    end
  end
end
