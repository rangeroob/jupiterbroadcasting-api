require 'cuba'
require 'json'
require 'rss'
require 'open-uri'

class ShowAddress < Cuba; end

public

def get(address, hash_number)
  ShowAddress.define do
    on get do
      on root do
        url = address
        open(url) do |rss|
          hash = Hash.new(hash_number)
          feed = RSS::Parser.parse(rss)
          feed.items.each.reverse_each do |item|
            data = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                     link: item.enclosure.url, desc: item.description }
            json = JSON.pretty_generate data
            res.headers['Content-Type'] = 'application/json; charset=utf-8'
            res.write(json)
          end
        end
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
            run ShowAddress.get('http://asknoah.fireside.fm/rss', '-1'.to_i)
          end
          on 'bsdnow' do
            run ShowAddress.get('http://feeds.feedburner.com/BsdNowMp3?format=xml', '0'.to_i)
          end
          on 'coderradio' do
            run ShowAddress.get('http://feeds.feedburner.com/coderradiomp3?format=xml', '54'.to_i)
          end
          on 'linuxactionnews' do
            run ShowAddress.get('http://linuxactionnews.com/rss', '-1'.to_i)
          end
          on 'linuxunplugged' do
            run ShowAddress.get('http://feeds.feedburner.com/linuxunplugged', '0'.to_i)
          end
          on 'techsnap' do
            run ShowAddress.get('http://feeds.feedburner.com/techsnapmp3', '190'.to.i)
          end
          on 'unfilter' do
            run ShowAddress.get('http://feeds.feedburner.com/jupiterbroadcasting/unfiltermp3', '39'.to_i)
          end
          on 'usererror' do
            run ShowAddress.get('http://feedpress.me/usererror', '0'.to_i)
          end
        end
        on 'archive' do
          on 'scibyte' do
            run ShowAddress.get('http://feeds.feedburner.com/scibyteaudio', '0'.to_i)
          end
        end
      end
    end
  end
end
