module AppAnnie
  class App
    attr_reader :raw,
                :account,
                :id,
                :account_id,
                :status,
                :name,
                :first_sales_date,
                :last_sales_date,
                :icon

    def initialize(account, attributes)
      @raw = attributes
      @account = account
      @id = attributes['app_id']
      @name = attributes['app_name']
      @status = attributes['status']
      @icon = attributes['icon']
      @first_sales_date = attributes['first_sales_date']
      @last_sales_date = attributes['last_sales_date']
    end

    def sales(options = {})
      json = request "/v1.2/accounts/#{@account.id}/apps/#{@id}/sales", options
      json['sales_list']
    end

  end
end
