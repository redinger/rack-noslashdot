require 'test_helper'

class NoslashdotTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    NoSlashdot.new(lambda { |env| [200, {}, "You've been slashdotted!"] }, :redirect => 'http://slashdot.org')
  end
  
  def test_redirects_to_where_it_should_if_slashdot
    get '/', {}, "HTTP_REFERER" => 'www.slashdot.org'
    assert last_response.redirect?
    follow_redirect!
    assert_equal 'http://slashdot.org/', last_request.url
  end
end