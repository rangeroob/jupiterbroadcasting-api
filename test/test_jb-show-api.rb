require 'cuba/test'
require_relative '../jb-show-api.rb'

scope do
  test '404 endpoint' do
    get 'api/jupiterbroadcasting/current/nonexistentshow'
    assert_equal 404, last_response.status
  end
  test 'asknoah endpoint' do
    get '/api/jupiterbroadcasting/current/asknoah'
    assert_equal 200, last_response.status
  end
  test 'bsdnow endpoint' do
    get '/api/jupiterbroadcasting/current/bsdnow'
    assert_equal 200, last_response.status
  end
  test 'coderradio endpoint' do
    get '/api/jupiterbroadcasting/current/coderradio'
    assert_equal 200, last_response.status
  end
  test 'linuxactionnews endpoint' do
    get '/api/jupiterbroadcasting/current/linuxactionnews'
    assert_equal 200, last_response.status
  end
  test 'linuxunplugged endpoint' do
    get '/api/jupiterbroadcasting/current/linuxunplugged'
    assert_equal 200, last_response.status
  end
  test 'techsnap endpoint' do
    get '/api/jupiterbroadcasting/current/techsnap'
    assert_equal 200, last_response.status
  end
  test 'unfilter endpoint' do
    get '/api/jupiterbroadcasting/current/unfilter'
    assert_equal 200, last_response.status
  end
  test 'usererror endpoint' do
    get '/api/jupiterbroadcasting/current/usererror'
    assert_equal 200, last_response.status
  end
  test 'scibyte endpoint' do
    get '/api/jupiterbroadcasting/archive/scibyte'
    assert_equal 200, last_response.status
  end
  test 'stoked endpoint' do
    get '/api/jupiterbroadcasting/archive/stoked'
    assert_equal 200, last_response.status
  end
  test 'techtalktoday endpoint' do
    get '/api/jupiterbroadcasting/archive/techtalktoday'
    assert_equal 200, last_response.status
  end
  test 'techtalktoday endpoint' do
    get '/api/jupiterbroadcasting/archive/techtalktoday'
    assert_equal 200, last_response.status
  end
  test 'womenstechradio endpoint' do
    get '/api/jupiterbroadcasting/archive/womenstechradio'
    assert_equal 200, last_response.status
  end
end
