Rails.application.routes.draw do
  mount RubyJwk::Engine => "/ruby_jwk"
end
