# frozen_string_literal: true

require 'rails_helper'

module RocketAdmin
  module Settings
    RSpec.describe '/settings/home', type: :request do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
      end

      describe '#index' do
        it 'renders a successful response' do
          get '/admin/settings/home/index'
          expect(response).to be_successful
        end
      end
    end
  end
end