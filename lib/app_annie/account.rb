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

    # @param [Hash] params
    def sales(params = nil)
      data = request "/v1.2/accounts/#{account_id}/sales", params

      data['sales_list']
    end
  end
end
