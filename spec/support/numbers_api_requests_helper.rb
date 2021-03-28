module NumbersApiRequestsHelper

  def stub_success_request
    before(:each) do
      FakeWeb.register_uri(
        :get, /http:\/\/numbersapi.com/,
        body: body.to_json,
        content_type: 'application/json'
      )
    end
  end

end