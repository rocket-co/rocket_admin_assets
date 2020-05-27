require 'autoprefixer-rails'
require 'sassc-rails'

module RocketAdminAssets
  class Engine < ::Rails::Engine
    isolate_namespace RocketAdminAssets

    initializer 'rocket_admin_assets.assets' do |app|
      %w(stylesheets javascripts).each do |sub|
        app.config.assets.paths << root.join('assets', sub).to_s
      end
    end
  end
end