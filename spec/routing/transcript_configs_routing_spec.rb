require 'rails_helper'

RSpec.describe TranscriptConfigsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/transcript_configs').to route_to('transcript_configs#index')
    end

    it 'routes to #new' do
      expect(get: '/transcript_configs/new').to route_to('transcript_configs#new')
    end

    it 'routes to #show' do
      expect(get: '/transcript_configs/1').to route_to('transcript_configs#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/transcript_configs/1/edit').to route_to('transcript_configs#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/transcript_configs').to route_to('transcript_configs#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/transcript_configs/1').to route_to('transcript_configs#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/transcript_configs/1').to route_to('transcript_configs#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/transcript_configs/1').to route_to('transcript_configs#destroy', id: '1')
    end
  end
end
