# desc "Explaining what the task does"
# task :rocket_admin_assets_assets do
#   # Task goes here
# end


require 'rocket_admin_assets/version'

desc "Pushing rocket_admin_assets-#{RocketAdminAssets::VERSION}.gem to gemfury"
task :deploy_gemfury_rocket_admin_assets do
  package = "pkg/rocket_admin_assets-#{RocketAdminAssets::VERSION}.gem"
  ::Git_branch = `git rev-parse --abbrev-ref HEAD`.freeze
  ::FURY_CMD = "fury push #{package} --as rocket-co"
  ::ERROR_PACKAGE_NOT_FOUND = "Error: gem #{package} is not found"
  ::ERROR_PACKAGE_VERSION_IN_BRANCH = "Error: gem #{package} cant be uploaded with #{RocketAdminAssets::VERSION} on #{Git_branch}"
  if File.exist? package
    if true || RocketAdminAssets.valid_for_master? && Git_branch.include?('master')
      system FURY_CMD
    elsif !Rocket.valid_for_master? && !Git_branch.include?('master')
      system FURY_CMD
    else
      warn ERROR_PACKAGE_VERSION_IN_BRANCH
      exit 1
    end
  else
    warn ERROR_PACKAGE_NOT_FOUND
    exit 1
  end
end

desc "Pushing rocket_admin_assets-#{RocketAdminAssets::VERSION}.gem to Github"
task :deploy_gemfury_rocket_admin_assets do
  package_folder = "pkg/rocket_admin_assets-#{RocketAdminAssets::VERSION}"
  package = "pkg/rocket_admin_assets-#{RocketAdminAssets::VERSION}.gem"
  ::Git_branch = `git rev-parse --abbrev-ref HEAD`.freeze

  # commands

  ::COMPILING_ASSETS = "rake assets:precompile" # RAILS_ENV=production
  ::CD_PACKAGE_FOLDER = ""
  ::UNPACK_GEM = "gem unpack rocket_admin_assets-0.1.1.gem"
  ::GIT_ADD_ORIGIN = 'git remote add origin git@github.com:rocket-co/rocket_admin_assets.gem.git'
  ::GIT_PUSH_MASTER = 'git push -u origin master'

  # Errors
  ::ERROR_PACKAGE_NOT_FOUND = "Error: gem #{package} is not found"
  ::ERROR_PACKAGE_VERSION_IN_BRANCH = "Error: gem #{package} cant be uploaded with #{RocketAdminAssets::VERSION} on #{Git_branch}"
  if File.exist? package
    if true || RocketAdminAssets.valid_for_master? && Git_branch.include?('master')
      system FURY_CMD
    elsif !Rocket.valid_for_master? && !Git_branch.include?('master')
      system FURY_CMD
    else
      warn ERROR_PACKAGE_VERSION_IN_BRANCH
      exit 1
    end
  else
    warn ERROR_PACKAGE_NOT_FOUND
    exit 1
  end
end
