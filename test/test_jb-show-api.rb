# frozen_string_literal: true

require 'cuba/test'
require_relative '../jb-show-api.rb'

scope do
  test '404 endpoint' do
    get 'api/jupiterbroadcasting/nonexistentshow'
    assert_equal 404, last_response.status
    get 'api/jupiterbroadcasting/linuxunplugged/10000'
    assert_equal 500, last_response.status
  end
end

scope do
  test 'coderradio endpoint' do
    get '/api/jupiterbroadcasting/coderradio'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
    get '/api/jupiterbroadcasting/coderradio/55'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
  end
end
scope do
  test 'linuxactionnews endpoint' do
    get '/api/jupiterbroadcasting/linuxactionnews'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
    get '/api/jupiterbroadcasting/linuxactionnews/1'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
  end
end
scope do
  test 'linuxunplugged endpoint' do
    get '/api/jupiterbroadcasting/linuxunplugged'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
    get '/api/jupiterbroadcasting/linuxunplugged/1'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
  end
end
scope do
  test 'selfhosted endpoint' do
    get '/api/jupiterbroadcasting/selfhosted'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
    get '/api/jupiterbroadcasting/selfhosted/1'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.content_type
  end
end
