require "ruby_jwk/version"
require "ruby_jwk/engine"
require "jwt"

module RubyJwk
  mattr_accessor :jwk_url
  mattr_accessor :skip_issuers
end
