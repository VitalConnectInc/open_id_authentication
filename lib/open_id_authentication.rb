# External Libraries
require "version_gem"

# This library
require_relative "open_id_authentication/version"

module OpenIdAuthentication
end

OpenIdAuthentication::Version.class_eval do
  extend VersionGem::Basic
end
