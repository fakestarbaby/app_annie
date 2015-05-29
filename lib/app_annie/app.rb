module AppAnnie
  class App
    include Request

    attr_reader :info,
                :product_id

    def initialize(account, product_id)
      @info = account
      @product_id = product_id
    end

    def account_id
      @info['account_id']
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

    def ranks(params = nil)
      raise MissingArgument, 'Param :start_date is required' unless params.has_key? :start_date
      raise MissingArgument, 'Param :end_date is required' unless params.has_key? :end_date

      request "/v1.2/apps/#{market}/app/#{product_id}/ranks", params
    end
  end
end
