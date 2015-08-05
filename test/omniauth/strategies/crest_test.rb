require 'test_helper'

module OmniAuth
  # Tests the Adapter attributes
  class CrestTest < Minitest::Test
    def setup
      @crest = OmniAuth::Strategies::Crest.new({})
    end

    def test_that_it_has_a_version_number
      refute_nil ::OmniAuth::Crest::VERSION
    end

    def test_has_correct_name
      assert_equal 'crest', @crest.options.name
    end

    def test_has_correct_client_options
      o = @crest.options.client_options
      assert_equal 'https://login.eveonline.com', o.site
    end
  end
end
