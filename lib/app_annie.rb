require 'faraday'
require 'json'
require 'app_annie/request'
require 'app_annie/error_response'
require 'app_annie/account'
require 'app_annie/app'
require 'app_annie/intelligence'
require 'app_annie/version'

module AppAnnie
  extend Request

  class << self
    attr_writer :api_key

    def api_key
      @api_key || ENV['APPANNIE_API_KEY']
    end

    def accounts(page_index = 0)
      request '/v1.2/accounts', page_index: page_index
    end

    def connection
      @connection ||= Faraday.new url: 'https://api.appannie.com' do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
  end

  class Exception < ::Exception; end
  class MissingArgument < Exception; end
  class Unauthorized < Exception; end
  class RateLimitExceeded < Exception; end
  class ServerError < Exception; end
  class ServerUnavailable < Exception; end
  class BadResponse < Exception; end

end
