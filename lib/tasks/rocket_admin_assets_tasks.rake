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
