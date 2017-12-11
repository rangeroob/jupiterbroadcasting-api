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

def get(address)
  ShowAddress.define do
    on get do
      on root do
        res.headers['Content-Type'] = 'application/json; charset=utf-8'
        begin
          get_rss = open(address)
        rescue OpenURI::HTTPError
          http_error_hash = { status: 'fail', rss: 'failure to retrieve data' }
          res.write(JSON.pretty_generate(http_error_hash))
        else
          pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
          res.write(pretty_json)
        end
      end
      on 'length' do
        get_rss = open(address)
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        parse_rss = JSON.parse(pretty_json)
        rss_length = parse_rss.fetch('rss').fetch('channel').fetch('item').to_a
                              .length
        res.write(rss_length - 1)
      end
      on ':episode' do |episode|
        begin
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          get_rss = open(address)
          pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
          parse_rss = JSON.parse(pretty_json)
          episode_location = parse_rss.fetch('rss').fetch('channel')
                                      .fetch('item').fetch(episode.to_i)
                                      .to_s.gsub('=>', ':')
        rescue IndexError
          res.status = 500
        else
          res.write(episode_location)
        end
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
        on 'current' do
          on 'asknoah' do
            run ShowAddress.get('http://asknoah.fireside.fm/rss')
          end
          on 'bsdnow' do
            run ShowAddress.get('http://feeds.feedburner.com/BsdNowMp3?format=xml')
          end
          on 'coderradio' do
            run ShowAddress.get('http://feeds.feedburner.com/coderradiomp3?format=xml')
          end
          on 'linuxactionnews' do
            run ShowAddress.get('http://linuxactionnews.com/rss')
          end
          on 'linuxunplugged' do
            run ShowAddress.get('http://feeds.feedburner.com/linuxunplugged')
          end
          on 'techsnap' do
            run ShowAddress.get('http://feeds.feedburner.com/techsnapmp3')
          end
          on 'unfilter' do
            run ShowAddress.get('http://feeds.feedburner.com/jupiterbroadcasting/unfiltermp3')
          end
          on 'usererror' do
            run ShowAddress.get('http://feedpress.me/usererror')
          end
        end
        on 'archive' do
          on 'planb' do
            run ShowAddress.get('http://feeds.feedburner.com/planbmp3')
          end
          on 'fauxshow' do
            run ShowAddress.get('http://www.jupiterbroadcasting.com/feeds/FauxShowMP3.xml')
          end
          on 'jupiternite' do
            run ShowAddress.get('http://feeds.feedburner.com/jupiternitemp3')
          end
          on 'mmorgue' do
            run ShowAddress.get('http://feeds.feedburner.com/MMOrgueMP3')
          end
          on 'scibyte' do
            run ShowAddress.get('http://feeds.feedburner.com/scibyteaudio')
          end
          on 'stoked' do
            run ShowAddress.get('http://feeds.feedburner.com/stoked?format=xml')
          end
          on 'techtalktoday' do
            run ShowAddress.get('http://feedpress.me/t3mp3')
          end
          on 'torked' do
            run ShowAddress.get('http://feeds.feedburner.com/TorkedMp3')
          end
          on 'womenstechradio' do
            run ShowAddress.get('http://feeds.feedburner.com/wtrmp3?format=xml')
          end
        end
      end
    end
  end
end
