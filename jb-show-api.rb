require 'cuba'
require 'json'
require 'rss'
require 'net/http'
require 'active_support/core_ext/hash'

class ShowAddress < Cuba; end

public

def get(address)
  ShowAddress.define do
    on get do
      on root do
        res.headers['Content-Type'] = 'application/json; charset=utf-8'
        get_rss = Net::HTTP.get_response(URI.parse(address)).body
        pretty_json = JSON.pretty_generate(Hash.from_xml(get_rss))
        res.write(pretty_json)
      end
    end
  end
end

Cuba.define do
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
          on 'scibyte' do
            run ShowAddress.get('http://feeds.feedburner.com/scibyteaudio')
          end
          on 'stoked' do
            run ShowAddress.get('http://feeds.feedburner.com/stoked?format=xml')
          end
          on 'techtalktoday' do
            run ShowAddress.get('http://feedpress.me/t3mp3')
          end
          on 'womenstechradio' do
            run ShowAddress.get('http://feeds.feedburner.com/wtrmp3?format=xml')
          end
        end
      end
    end
  end
end
