require 'omniauth/strategies/oauth2'
require 'uri'
require 'rack/utils'

module OmniAuth
  module Strategies
    class Smarthr < OmniAuth::Strategies::OAuth2
      option :name, 'smarthr'

      option :authorize_options, [:scope]

      option :client_options, {
        authorize_url: '/oauth/authorization',
        token_url: '/oauth/token',
      }

      option :authorize_params, {
        response_type: 'code',
      }

      option :service_domain, 'smarthr.jp'

      uid { request_subdomain }

      info do
        {
          subdomain: request_subdomain,
          tenant_id: raw_info['token_request_tenant_id'],
        }
      end

      extra do
        {}
      end

      def raw_info
        @raw_info ||= access_token.params
      end

      def request_subdomain
        subdomain = request.params['subdomain'] || request.session['smarthr_subdomain']
        request.session['smarthr_subdomain'] = subdomain if subdomain

        subdomain
      end

      def add_dynamic_site(hash)
        subdomain = request_subdomain || 'app'
        hash[:site] = "https://#{subdomain}.#{options.service_domain}"
        hash
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, add_dynamic_site(deep_symbolize(options.client_options)))
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
