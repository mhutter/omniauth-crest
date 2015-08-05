require 'test_helper'

module OmniAuth
  # Tests the Adapter attributes
  class CrestTest < Minitest::Test
    def setup
      stub_requests
    end

    def test_that_it_has_a_version_number
      refute_nil ::OmniAuth::Crest::VERSION
    end

    def test_has_correct_name
      assert_equal 'crest', crest.options.name
    end

    def test_has_correct_client_options
      o = crest.options.client_options
      assert_equal 'https://login.eveonline.com', o.site
    end

    def test_redirects_to_start_oauth_flow
      get '/auth/crest'
      assert_equal 302, last_response.status
      redirect = URI(last_response.headers['Location'])
      assert_equal 'https', redirect.scheme
      assert_equal 'login.eveonline.com', redirect.host
      assert_equal '/oauth/authorize', redirect.path

      redirect_params = Rack::Utils.parse_nested_query(redirect.query)
      assert_equal 'sekrit_client_id', redirect_params['client_id']
      assert_equal 'code', redirect_params['response_type']
      assert_equal 'http://example.org/auth/crest/callback',
                   redirect_params['redirect_uri']
      refute_nil redirect_params['state']
    end

    def test_receives_callback
      state = SecureRandom.hex(24)
      get '/auth/crest/callback', { 'state' => state },
          { 'rack.session' => { 'omniauth.state' => state } }

      assert_equal 200, last_response.status

      oe = MultiJson.decode(last_response.body)
      assert_equal 'crest', oe['provider']
      assert_equal 273042051, oe['uid']
      assert_equal 'CCP illurkall', oe['info']['name']
      assert_equal 273042051, oe['info']['character_id']
      assert_equal '2014-05-23T15:01:15.182864Z', oe['info']['expires_on']
      assert_equal ' ', oe['info']['scopes']
      assert_equal 'Character', oe['info']['token_type']
      assert_equal 'XM4D...FoY=', oe['info']['character_owner_hash']
      assert_equal 'uNEEh...a_WpiaA2', oe['credentials']['token']
      exp = Time.now.to_i + 300
      assert_in_delta exp, oe['credentials']['expires_at'], 1
      assert_equal true, oe['credentials']['expires']
      assert_equal 273042051, oe['extra']['raw_info']['CharacterID']
      assert_equal 'CCP illurkall', oe['extra']['raw_info']['CharacterName']
      assert_equal '2014-05-23T15:01:15.182864Z', oe['extra']['raw_info']['ExpiresOn']
      assert_equal ' ', oe['extra']['raw_info']['Scopes']
      assert_equal 'Character', oe['extra']['raw_info']['TokenType']
      assert_equal 'XM4D...FoY=', oe['extra']['raw_info']['CharacterOwnerHash']
    end
  end
end
