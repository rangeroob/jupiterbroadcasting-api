require 'cuba/test'
require_relative '../jb-show-api.rb'

scope do
  test '404 endpoint' do
    get 'api/jupiterbroadcasting/current/nonexistentshow'
    assert_equal 404, last_response.status
    get 'api/jupiterbroadcasting/archive/fauxshow/1000'
    assert_equal 500, last_response.status
  end
end
scope do
  test 'asknoah endpoint' do
    get '/api/jupiterbroadcasting/current/asknoah'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/asknoah/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/asknoah/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'bsdnow endpoint' do
    get '/api/jupiterbroadcasting/current/bsdnow'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/bsdnow/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/bsdnow/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'coderradio endpoint' do
    get '/api/jupiterbroadcasting/current/coderradio'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/coderradio/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/coderradio/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'linuxactionnews endpoint' do
    get '/api/jupiterbroadcasting/current/linuxactionnews'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/linuxactionnews/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/linuxactionnews/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'linuxactionshow endpoint' do
    get '/api/jupiterbroadcasting/archive/linuxactionshow'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/linuxactionshow/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/linuxactionshow/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'linuxunplugged endpoint' do
    get '/api/jupiterbroadcasting/current/linuxunplugged'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/linuxunplugged/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/linuxunplugged/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'techsnap endpoint' do
    get '/api/jupiterbroadcasting/current/techsnap'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/techsnap/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/techsnap/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'unfilter endpoint' do
    get '/api/jupiterbroadcasting/current/unfilter'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/unfilter/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/unfilter/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'usererror endpoint' do
    get '/api/jupiterbroadcasting/current/usererror'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/usererror/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/current/usererror/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'fauxshow endpoint' do
    get '/api/jupiterbroadcasting/archive/fauxshow'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/fauxshow/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/fauxshow/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'howtolinux endpoint' do
    get '/api/jupiterbroadcasting/archive/howtolinux'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/howtolinux/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/howtolinux/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'indepthlook endpoint' do
    get '/api/jupiterbroadcasting/archive/indepthlook'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/indepthlook/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/indepthlook/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'jointfailures endpoint' do
    get '/api/jupiterbroadcasting/archive/jointfailures'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/jointfailures/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/jointfailures/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'jupiter@nite endpoint' do
    get '/api/jupiterbroadcasting/archive/jupiternite'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/jupiternite/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/jupiternite/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'legendofthestondedowl endpoint' do
    get '/api/jupiterbroadcasting/archive/legendofthestonedowl'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/legendofthestonedowl/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/legendofthestonedowl/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'mmorgue endpoint' do
    get '/api/jupiterbroadcasting/archive/mmorgue'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/mmorgue/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/mmorgue/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'planb endpoint' do
    get '/api/jupiterbroadcasting/archive/planb'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/planb/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/planb/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'scibyte endpoint' do
    get '/api/jupiterbroadcasting/archive/scibyte'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/scibyte/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/scibyte/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'stoked endpoint' do
    get '/api/jupiterbroadcasting/archive/stoked'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/stoked/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/stoked/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'techtalktoday endpoint' do
    get '/api/jupiterbroadcasting/archive/techtalktoday'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/techtalktoday/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/techtalktoday/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'torked endpoint' do
    get '/api/jupiterbroadcasting/archive/torked'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/torked/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/torked/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
scope do
  test 'womenstechradio endpoint' do
    get '/api/jupiterbroadcasting/archive/womenstechradio'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/womenstechradio/length'
    assert_equal 200, last_response.status
    assert_equal 'text/html; charset=utf-8', last_response.content_type
    get '/api/jupiterbroadcasting/archive/womenstechradio/0'
    assert_equal 200, last_response.status
    assert_equal 'application/json; charset=utf-8', last_response.content_type
  end
end
