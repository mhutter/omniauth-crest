$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler'
Bundler.require(:default, :test)
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
include Rack::Test::Methods

require 'omniauth/strategies/crest'
require 'securerandom'
require 'fixtures/requests'

# disable outgoing requests
WebMock.disable_net_connect!
# silence the logger
OmniAuth.config.logger = Logger.new(StringIO.new)

def crest
  @crest ||= OmniAuth::Strategies::Crest.new({})
end

# return or create an app
def app
  @app || make_app
end

# create an app
def make_app(options = {})
  client_id = 'sekrit_client_id'
  secret_key = 'sekrit_key'

  client_id = options.delete(:client_id) if options.has_key? :client_id
  secret_key = options.delete(:secret_key) if options.has_key? :secret_key

  Sinatra.new do
    configure do
      enable :sessions
      set :show_exceptions, false
      set :session_secret, SecureRandom.hex
    end

    use OmniAuth::Builder do
      provider :crest, client_id, secret_key
    end

    get '/auth/crest/callback' do
      env['omniauth.auth'].to_json
    end
  end
end
