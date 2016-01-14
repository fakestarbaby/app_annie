module AppAnnie
  class App
    include Request

    attr_reader :info,
                :product_id,
                :asset,
                :account_id,
                :vertical

    attr_accessor :market

    def initialize(account, product)
      @info = account
      @product = product

      @asset = 'app'

      @account_id = @info['account_id']
      @market = @info['market']
      @vertical = @info['vertical']

      @product_id = product['product_id']
    end

    def iap_list(params = nil)
      request "/v1.2/accounts/#{account_id}/products/#{product_id}/iaps", params
    end

    def sales(params = nil)
      request "/v1.2/accounts/#{account_id}/products/#{product_id}/sales", params
    end

    def features(params = nil)
      raise MissingArgument, 'Param :start_date is required' unless params.has_key? :start_date
      raise MissingArgument, 'Param :end_date is required' unless params.has_key? :end_date

      request "/v1.2/#{vertical}/#{market}/#{asset}/#{product_id}/features", params
    end

    def ranks(params = nil)
      raise MissingArgument, 'Param :start_date is required' unless params.has_key? :start_date
      raise MissingArgument, 'Param :end_date is required' unless params.has_key? :end_date

      request "/v1.2/#{vertical}/#{market}/#{asset}/#{product_id}/ranks", params
    end

    def reviews(params = nil)
      request "/v1.2/#{vertical}/#{market}/#{asset}/#{product_id}/reviews", params
    end

    def ratings(params = nil)
      request "/v1.2/#{vertical}/#{market}/#{asset}/#{product_id}/ratings", params
    end
  end
end
