require 'cuba/test'
require_relative '../jb-show-api.rb'

scope do
  test '404 endpoint' do
    get 'api/jupiterbroadcasting/current/nonexistentshow'
    assert_equal 404, last_response.status
  end
end
scope do
  test 'asknoah endpoint' do
    get '/api/jupiterbroadcasting/current/asknoah'
    get '/api/jupiterbroadcasting/current/asknoah/length'
    get '/api/jupiterbroadcasting/current/asknoah/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'bsdnow endpoint' do
    get '/api/jupiterbroadcasting/current/bsdnow'
    get '/api/jupiterbroadcasting/current/bsdnow/length'
    get '/api/jupiterbroadcasting/current/bsdnow/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'coderradio endpoint' do
    get '/api/jupiterbroadcasting/current/coderradio'
    get '/api/jupiterbroadcasting/current/coderradio/length'
    get '/api/jupiterbroadcasting/current/coderradio/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'linuxactionnews endpoint' do
    get '/api/jupiterbroadcasting/current/linuxactionnews'
    get '/api/jupiterbroadcasting/current/linuxactionnews/length'
    get '/api/jupiterbroadcasting/current/linuxactionnews/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'linuxunplugged endpoint' do
    get '/api/jupiterbroadcasting/current/linuxunplugged'
    get '/api/jupiterbroadcasting/current/linuxunplugged/length'
    get '/api/jupiterbroadcasting/current/linuxunplugged/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'techsnap endpoint' do
    get '/api/jupiterbroadcasting/current/techsnap'
    get '/api/jupiterbroadcasting/current/techsnap/length'
    get '/api/jupiterbroadcasting/current/techsnap/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'unfilter endpoint' do
    get '/api/jupiterbroadcasting/current/unfilter'
    get '/api/jupiterbroadcasting/current/unfilter/length'
    get '/api/jupiterbroadcasting/current/unfilter/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'usererror endpoint' do
    get '/api/jupiterbroadcasting/current/usererror'
    get '/api/jupiterbroadcasting/current/usererror/length'
    get '/api/jupiterbroadcasting/current/usererror/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test ' planb endpoint' do
    get '/api/jupiterbroadcasting/archive/planb'
    get '/api/jupiterbroadcasting/archive/planb/length'
    get '/api/jupiterbroadcasting/archive/planb/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'fauxshow endpoint' do
    get '/api/jupiterbroadcasting/archive/fauxshow'
    get '/api/jupiterbroadcasting/archive/fauxshow/length'
    get '/api/jupiterbroadcasting/archive/fauxshow/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'jupiter@nite endpoint' do
    get '/api/jupiterbroadcasting/archive/jupiternite'
    get '/api/jupiterbroadcasting/archive/jupiternite/length'
    get '/api/jupiterbroadcasting/archive/jupiternite/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'mmorgue endpoint' do
    get '/api/jupiterbroadcasting/archive/mmorgue'
    get '/api/jupiterbroadcasting/archive/mmorgue/length'
    get '/api/jupiterbroadcasting/archive/mmorgue/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'scibyte endpoint' do
    get '/api/jupiterbroadcasting/archive/scibyte'
    get '/api/jupiterbroadcasting/archive/scibyte/length'
    get '/api/jupiterbroadcasting/archive/scibyte/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'stoked endpoint' do
    get '/api/jupiterbroadcasting/archive/stoked'
    get '/api/jupiterbroadcasting/archive/stoked/length'
    get '/api/jupiterbroadcasting/archive/stoked/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'techtalktoday endpoint' do
    get '/api/jupiterbroadcasting/archive/techtalktoday'
    get '/api/jupiterbroadcasting/archive/techtalktoday/length'
    get '/api/jupiterbroadcasting/archive/techtalktoday/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'torked endpoint' do
    get '/api/jupiterbroadcasting/archive/torked'
    get '/api/jupiterbroadcasting/archive/torked/length'
    get '/api/jupiterbroadcasting/archive/torked/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'womenstechradio endpoint' do
    get '/api/jupiterbroadcasting/archive/womenstechradio'
    get '/api/jupiterbroadcasting/archive/womenstechradio/length'
    get '/api/jupiterbroadcasting/archive/womenstechradio/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
