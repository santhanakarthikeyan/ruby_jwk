require_relative "lib/ruby_jwk/version"

Gem::Specification.new do |spec|
  spec.name        = "ruby_jwk"
  spec.version     = RubyJwk::VERSION
  spec.authors     = ["santhanakarthikeyan"]
  spec.email       = ["santhanakarthikeyan@hotmail.com"]
  spec.homepage    = "https://github.com/santhanakarthikeyan/ruby_jwk"
  spec.summary     = "Authenticate JWKs via public JWT enspoint"
  spec.description = "Authenticate JWKs via public JWT enspoint"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/santhanakarthikeyan/ruby_jwk"
  spec.metadata["changelog_uri"] = "https://github.com/santhanakarthikeyan/ruby_jwk"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.4"
  spec.add_dependency "jwt"
end
