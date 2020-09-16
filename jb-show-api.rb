# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'cuba'
require 'cuba/safe'
require 'json'
require 'open-uri'
require 'rack/cors'

Cuba.plugin Cuba::Safe

Cuba.use Rack::Cors do
  allow do
    origins '*'

    resource '/api/*',
             methods: [:get],
             headers: [:any],
             max_age: 0
  end
end

class ShowAddress < Cuba; end

public

def get_coderradio(address)
  ShowAddress.define do
    on get do
      on root do
        get_rss = open(address)
      rescue OpenURI::HTTPError
        res.status = 404
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        res.json(pretty_json)
      end
      on ':episode' do |episode|
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        json_http_error = JSON.pretty_generate(http_error_hash).to_s
        json_http_error_array = Array.new(55, json_http_error)
        get_rss = open(address)
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        parse_rss = JSON.parse(pretty_json)
        episode_location = parse_rss.fetch('rss').fetch('channel')
                                    .fetch('item')
                                    .reverse
                                    .unshift(*json_http_error_array)
                                    .fetch(episode.to_i)
                                    .to_s.gsub('=>', ':')
      rescue OpenURI::HTTPError
        res.status = 404
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        res.json(episode_location)
      end
    end
  end
end

def get_linuxunplugged(address)
  ShowAddress.define do
    on get do
      on root do
        get_rss = open(address)
      rescue OpenURI::HTTPError
        res.status = 404
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        res.json(pretty_json)
      end
      on ':episode' do |episode|
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        json_http_error = JSON.pretty_generate(http_error_hash).to_s
        get_rss = open(address)
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        parse_rss = JSON.parse(pretty_json)
        episode_location = parse_rss.fetch('rss').fetch('channel')
                                    .fetch('item')
                                    .reverse.unshift(json_http_error)
                                    .fetch(episode.to_i)
                                    .to_s.gsub('=>', ':')
      rescue OpenURI::HTTPError
        res.status = 404
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        res.json(episode_location)
      end
    end
  end
end

def get_selfhosted_and_linuxactionnews(address)
  ShowAddress.define do
    on get do
      on root do
        get_rss = open(address)
      rescue OpenURI::HTTPError
        res.status = 404
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        res.json(pretty_json)
      end
      on ':episode' do |episode|
        http_error_hash = { status: 'fail', code: 404, rss: 'failure to retrieve data' }
        get_rss = open(address)
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        parse_rss = JSON.parse(pretty_json)
        episode_location = parse_rss.fetch('rss').fetch('channel')
                                    .fetch('item')
                                    .reverse
                                    .fetch(episode.to_i)
                                    .to_s.gsub('=>', ':')
      rescue OpenURI::HTTPError
        res.status = 404
        res.json(JSON.pretty_generate(http_error_hash))
      rescue IndexError
        res.status = 500
        index_error_hash = { status: 'fail', code: 500, rss: 'failure to retrieve data' }
        res.json(JSON.pretty_generate(index_error_hash))
      else
        res.json(episode_location)
      end
    end
  end
end

Cuba.define do
  on csrf.unsafe? do
    csrf.reset!
    res.status = 403
    res.write('Not authorized')
    halt(res.finish)
  end
  on get do
    on 'api' do
      on 'jupiterbroadcasting' do
        on 'coderradio' do
          run ShowAddress.get_coderradio('https://coder.show/rss')
        end
        on 'linuxactionnews' do
          run ShowAddress.get_selfhosted_and_linuxactionnews('https://linuxactionnews.com/rss')
        end
        on 'linuxunplugged' do
          run ShowAddress.get_linuxunplugged('https://linuxunplugged.com/rss')
        end
        on 'selfhosted' do
          run ShowAddress.get_selfhosted_and_linuxactionnews('https://feeds.fireside.fm/selfhosted/rss')
        end
      end
    end
  end
end
