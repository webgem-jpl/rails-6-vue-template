require 'rails_helper'

RSpec.describe TranscriptOptionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/transcript_options').to route_to('transcript_options#index')
    end

    it 'routes to #new' do
      expect(get: '/transcript_options/new').to route_to('transcript_options#new')
    end

    it 'routes to #show' do
      expect(get: '/transcript_options/1').to route_to('transcript_options#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/transcript_options/1/edit').to route_to('transcript_options#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/transcript_options').to route_to('transcript_options#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/transcript_options/1').to route_to('transcript_options#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/transcript_options/1').to route_to('transcript_options#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/transcript_options/1').to route_to('transcript_options#destroy', id: '1')
    end
  end
end
