# frozen_string_literal: true

# https://semver.org/lang/es/
# por favor referirse a el versionamiento semantico para generar las versiones en pruebas
#= para pruebas en local generar version con
#= VERSION-alpha.nombre.de.la.rama
#= '2.0.1-alpha.initial.test'
#= '2.0.1-alpha.initial.test2'
#= fixed according => https://github.com/rubygems/rubygems/issues/592
# more examples in => https://github.com/RiotGamesMinions/thor-scmversion
# validated against https://regexr.com/39s32
module RocketAdminAssets
  VERSION = '0.1.1'
  def self.valid_for_master?
    VERSION.match?(/^(([0-9]+)\.([0-9]+)\.([0-9]+)?)$/)
  end
end
