$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rocket_admin_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rocket_admin_assets"
  spec.version     = RocketAdminAssets::VERSION
  spec.authors     = ["Andres Murcia"]
  spec.email       = ["andres@blackrocket.co"]
  spec.homepage    = "https://blackrocket.co"
  spec.summary     = "Summary of RocketAdminAssets."
  spec.description = "Description of RocketAdminAssets."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://gemfury.com'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir['{app,config,db,lib,bin,assets}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md', 'package.json']

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.1"
  spec.add_dependency "sass"
  spec.add_dependency "sass-rails"
  spec.add_dependency 'sassc-rails', '>= 2.0.0'
  spec.add_dependency 'autoprefixer-rails', '>= 9.1.0'

  spec.add_development_dependency "sqlite3"
end
