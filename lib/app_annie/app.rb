module AppAnnie
  class App
    include Request

    attr_reader :info,
                :product_id,
                :asset

    def initialize(account, product)
      @info = account
      @product = product

      @asset = 'app'

      @product_id = product['product_id']
    end

    def account_id
      @info['account_id']
    end

    def vertical
      @info['vertical']
    end

    def market
      @info['market']
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

      unless params.has_key? :device
        params[:device] = @product['devices'].first unless @product['devices'].nil?
      end

      raise MissingArgument, 'Param :device is required' unless params.has_key? :device

      request "/v1.2/#{vertical}/#{market}/#{asset}/#{product_id}/ranks", params
    end
  end
end
