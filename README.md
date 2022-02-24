# RubyJwk
Authenticate JWT with JWKs. 

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ruby_jwk'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ruby_jwk
```
## Getting started

Authentication system exposes a JWKS endpoint for each tenant, which looks like `https://YOUR_DOMAIN/.well-known/jwks.json`. This endpoint will contain the JWK used to verify all Authentication JWTs for this tenant. This endpoint has to be configured like below in initializer file. 

```ruby
RubyJwk.jwk_url = 'https://YOUR_DOMAIN/.well-known/jwks.json'
RubyJwk.skip_issuers = [] # to skip authentication for certain issuers
```

Suppose each tenant has different endpoint then configure it as below. Here `:tenant_name` gets replaced by `tenant` attribute in JWT payload. 

```ruby
RubyJwk.jwk_url = 'https://:tenant_name/.well-known/jwks.json'
```

To set up a controller with tenant authentication, just add this before_action

```ruby
 class ApplicationController < ActionController::API
   include RubyJwk::Authenticate
   before_action :authenticate_tenant!
end
```
To get the JWT payload, use the following helper:
```ruby
jwt_payload
```

### Token verification 
Currently, we support below verifications
* Signature
* Token expiry
* nbf

## Reference
https://blog.unathichonco.com/verifying-jwts-with-jwks-in-ruby

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
