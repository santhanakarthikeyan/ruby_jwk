module RubyJwk
  module Authenticate
    def authenticate_tenant!
      return if RubyJwk.skip_issuers.to_a.include?(jwt_payload['iss'])

      JWT.decode(jwt_token, nil, true, { algorithm: 'RS256', jwks: jwk_loader})
    rescue JWT::DecodeError => e
      render status: 401, json: error_response_template("Authentication failed! - #{e.message}")
    end

    def jwt_payload
      @jwt_payload ||= JWT.decode(jwt_token, nil, false).first
    rescue JWT::DecodeError => e
      render status: 401, json: error_response_template("Authentication failed! - #{e.message}")
    end

    def jwt_tenant_name
      jwt_payload.dig('tenant')
    end

    def jwt_token
      return unless auth_header.starts_with?('Bearer ')

      auth_header.to_s.gsub('Bearer ', '')
    end

    private

    # invalidate becomes true when kid not found
    def jwk_loader
      ->(options) do
        fetch_jwks(options[:invalidate])
      end
    end

    def fetch_jwks(force = false)
      Rails.cache.fetch("#{tenant_name}_JWKS", force: force) do
        res = HTTParty.get(RubyJwk.jwk_url.gsub(':tenant_name', tenant_name))
        res.code == 200 ? res.parsed_response : {}
      end
    end

    def error_response_template(msg)
      {
        error: {
          status: 401,
          message: msg,
          errors: nil,
          code: nil
        }
      }
    end

    def auth_header
      request.headers['Authorization'].to_s
    end
  end
end
