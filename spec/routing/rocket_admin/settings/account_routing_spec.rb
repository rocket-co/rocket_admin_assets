# frozen_string_literal: true

require 'rails_helper'
module RocketAdmin
  module Settings
    RSpec.describe AccountController, type: :routing do
      describe 'Routing' do
        it 'routes to #index' do
          expect(get: 'admin/settings/account/my_account').to route_to('rocket_admin/settings/account#my_account', locale: 'en')
        end

        it 'routes to #destroy' do
          expect(delete: 'admin/settings/account/destroy').to route_to('rocket_admin/settings/account#destroy', locale: 'en')
        end
      end
    end
  end
end
