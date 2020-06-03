# frozen_string_literal: true

require 'rails_helper'

module RocketAdmin
  module Settings
    RSpec.describe '/settings/account', type: :request do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
      end

      describe '#my_account' do
        it 'renders a successful response' do
          get '/admin/settings/account/my_account'
          expect(response).to be_successful
        end
      end

      describe '#destroy' do
        before(:each) do
          @user = create(:user)
        end

        it 'destroy account' do
          #skip 'Fix'
          params_account = {
            email: @user.email,
            confirmation: 'delete',
            password: 'password'
          }

          sign_in @user

          expect do
            delete '/admin/settings/account/destroy', xhr: true, params: { account: params_account }
          end.to change(User, :count).by(-1)

          expect(response).to be_successful
          expect(User.with_deleted.count).to eq(2)
          expect(User.with_deleted.last).to eq(@user)
          assert_equal "window.location = '/users/sign_in'", @response.body
          assert_equal 'text/javascript', @response.media_type
        end

        it 'not destroy account' do
          params_account = {
            email: '',
            confirmation: '',
            password: ''
          }

          sign_in @user

          delete '/admin/settings/account/destroy', xhr: true, params: { account: params_account }

          expect(response).to be_successful
          expect(User.count).to eq(2)
          expect(User.deleted.count).to eq(0)
          expect(User.last).to eq(@user)
          assert_equal 'text/javascript', @response.media_type
        end
      end
    end
  end
end