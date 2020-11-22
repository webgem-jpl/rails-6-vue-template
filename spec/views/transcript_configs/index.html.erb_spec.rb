# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'transcript_configs/index', type: :view do
  before(:each) do
    assign(:transcript_configs, [
             TranscriptConfig.create!(
               name: 'Name',
               config: 'MyText'
             ),
             TranscriptConfig.create!(
               name: 'Name',
               config: 'MyText'
             )
           ])
  end

  it 'renders a list of transcript_configs' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
