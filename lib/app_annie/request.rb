module AppAnnie
  module Request
    private
    def request(url, params = nil)
      response = AppAnnie.connection.get do |req|
        req.headers['Authorization'] = "Bearer #{AppAnnie.api_key}"
        req.headers['Accept'] = 'application/json'
        req.url url, params
      end

      if response.status == 200
        JSON.parse(response.body)
      else
        ErrorResponse.raise_for(response)
      end
    end
  end
end
