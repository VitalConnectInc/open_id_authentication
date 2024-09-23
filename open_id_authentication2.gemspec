# Get the GEMFILE_VERSION without *require* "my_gem/version", for code coverage accuracy
# See: https://github.com/simplecov-ruby/simplecov/issues/557#issuecomment-825171399
load "lib/open_id_authentication/version.rb"
gem_version = OpenIdAuthentication::Version::VERSION
OpenIdAuthentication::Version.send(:remove_const, :VERSION)

Gem::Specification.new do |spec|
  spec.name = "open_id_authentication2"
  spec.version = gem_version
  spec.summary = "A gem-stub for open_id_authentication"
  spec.authors = ["Peter Boling"]
  spec.email = "peter.boling@gmail.com"
  spec.homepage = "https://github.com/oauth-xx/#{spec.name}"

  # See CONTRIBUTING.md
  spec.cert_chain = [ENV.fetch("GEM_CERT_PATH", "certs/#{ENV.fetch("GEM_CERT_USER", ENV["USER"])}.pem")]
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $PROGRAM_NAME.end_with?("gem")

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir[
    # Splats (alphabetical)
    "lib/**/*.rb",
    # Files (alphabetical)
    "CHANGELOG.md",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
    "LICENSE.txt",
    "README.md",
    "SECURITY.md"
  ]
  spec.executables = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata["wiki_uri"] = "#{spec.homepage}/wiki"
  spec.metadata["funding_uri"] = "https://liberapay.com/pboling"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency("version_gem", "~> 1.1", ">= 1.1.4")
end
