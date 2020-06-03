# frozen_string_literal: true

require 'rails_helper'

module RocketAdmin
  RSpec.describe UsersController, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/admin/users').to route_to('rocket_admin/users#index', locale: 'en')
      end

      it 'routes to #new' do
        expect(get: '/admin/users/new').to route_to('rocket_admin/users#new', locale: 'en')
      end
      #
      # it 'routes to #show' do
      #   expect(get: '/store_admin/categories/1').to route_to('store_admin/categories#show', id: '1')
      # end
      #
      it 'routes to #edit' do
        expect(get: '/admin/users/1/edit').to route_to('rocket_admin/users#edit', id: '1', locale: 'en')
      end

      it 'routes to #create' do
        expect(post: '/admin/users').to route_to('rocket_admin/users#create', locale: 'en')
      end

      it 'routes to #update via PUT' do
        expect(put: '/admin/users/1').to route_to('rocket_admin/users#update', id: '1', locale: 'en')
      end

      # it 'routes to #update via PATCH' do
      #   expect(patch: '/store_admin/categories/1').to route_to('store_admin/categories#update', id: '1')
      # end
      #
      it 'routes to #delete' do
        expect(get: '/admin/users/1/delete').to route_to('rocket_admin/users#delete', id: '1', locale: 'en')
      end

      it 'routes to #destroy' do
        expect(delete: '/admin/users/1').to route_to('rocket_admin/users#destroy', id: '1', locale: 'en')
      end
    end
  end
end
