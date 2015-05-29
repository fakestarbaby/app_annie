module AppAnnie
  class Account
    include Request

    attr_reader :raw

    def initialize(info)
      @raw = info
    end

    def account_id
      @raw['account_id']
    end

    def market
      @raw['market']
    end

    # @param [Hash] product
    # @return [AppAnnie::App]
    def product_api(product)
      AppAnnie::App.new raw, product
    end

    def products(params = nil)
      request "/v1.2/accounts/#{account_id}/products", params
    end

    # @param [Hash] params
    def sales(params = nil)
      request "/v1.2/accounts/#{account_id}/sales", params
    end
  end
end
