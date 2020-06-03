# frozen_string_literal: true

require 'rails_helper'

module RocketAdmin
  module Settings
    RSpec.describe HomeController, type: :routing do
      it '#index' do
        expect(get: 'admin/settings/home/index').to route_to('rocket_admin/settings/home#index', locale: 'en')
      end
    end
  end
end

