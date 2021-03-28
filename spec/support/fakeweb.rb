require 'fakeweb'

FakeWeb.allow_net_connect = %r[^http://127\.0\.0\.1|^http://localhost]

RSpec.configure do |config|
  config.before(:each) do
    FakeWeb.clean_registry
  end
end

RSpec.shared_examples :with_allow_net_connect! do
  before(:each) do
    FakeWeb.allow_net_connect = true
  end

  after(:each) do
    FakeWeb.allow_net_connect = %r[^http://127\.0\.0\.1|^http://localhost]
  end
end