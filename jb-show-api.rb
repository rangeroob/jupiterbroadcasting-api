require 'cuba'
require 'json'
require 'rss'
require 'open-uri'

class UserError < Cuba; end
UserError.define do
  on get do
    on root, param('e') do |e|
      res.write(e)
    end
    on true do
      url = 'http://feedpress.me/usererror'
      open(url) do |rss|
        hash = Hash.new(0)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          @usererror_title = item.title.to_json
          @usererror_pubdate = item.pubDate
          @usererror_link = item.enclosure.url
          @usererror_episode_desc = item.description
          @usererror_episdoe = item.itunes_subtitle
          usererrordata = { id: hash[:id] += 1, title: @usererror_title, pubDate: @usererror_pubdate,
                            link: @usererror_link, desc: @usererror_episode_desc }
          usererrorjson = JSON.pretty_generate usererrordata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(usererrorjson)
        end
      end
    end
  end
end

class LinuxActionNews < Cuba; end
LinuxActionNews.define do
  on get do
    on root do
      url = 'http://linuxactionnews.com/rss'
      open(url) do |rss|
        hash = Hash.new(-1)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          @linuxactionnews_title = item.title.to_json
          @linuxactionnews_pubdate = item.pubDate
          @linuxactionnews_link = item.enclosure.url
          @linuxactionnews_episode_desc = item.description
          linuxactionnewsdata = { id: hash[:id] += 1, title: @linuxactionnews_title, pubDate: @linuxactionnews_pubdate,
                                  link: @linuxactionnews_link, desc: @linuxactionnews_episode_desc }
          linuxactionnewsjson = JSON.pretty_generate linuxactionnewsdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(linuxactionnewsjson)
        end
      end
    end
  end
end

class CoderRadio < Cuba; end
CoderRadio.define do
  on get do
    on root do
      url = 'http://feeds.feedburner.com/coderradiomp3?format=xml'
      open(url) do |rss|
        hash = Hash.new(0)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          @coderradio_title = item.title.to_json
          @coderradio_pubdate = item.pubDate
          @coderradio_link = item.enclosure.url
          @coderraiod_episode_desc = item.description
          coderradiodata = { id: hash[:id] += 1, title: @coderradio_title, pubDate: @coderradio_pubdate,
                             link: @coderradio_link }
          coderradiojson = JSON.pretty_generate coderradiodata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(coderradiojson)
        end
      end
    end
  end
end

class AskNoah < Cuba; end
AskNoah.define do
  on get do
    on root do
      url = 'http://asknoah.fireside.fm/rss'
      open(url) do |rss|
        hash = Hash.new(-1)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          @asknoah_title = item.title.to_json
          @asknoah_pubdate = item.pubDate
          @asknoah_link = item.enclosure.url
          @asknoah_episode_desc = item.description
          asknoahdata = { id: hash[:id] += 1, title: @asknoah_title, pubDate: @asknoah_pubdate,
                          link: @asknoah_link, desc: @asknoah_episode_desc }
          asknoahjson = JSON.pretty_generate asknoahdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(asknoahjson)
        end
      end
    end
  end
end

class BSDNow < Cuba; end
BSDNow.define do
  on get do
    on root do
      url = 'http://feeds.feedburner.com/BsdNowMp3?format=xml'
      open(url) do |rss|
        hash = Hash.new(0)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          @bsdnow_title = item.title.to_json
          @bsdnow_pubdate = item.pubDate
          @bsdnow_link = item.enclosure.url
          @bsdnow_episode_desc = item.description
          bsdnowdata = { id: hash[:id] += 1, title: @bsdnow_title, pubDate: @bsdnow_pubdate,
                         link: @bsdnow_link, desc: @bsdnow_episode_desc }
          bsdnowjson = JSON.pretty_generate bsdnowdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(bsdnowjson)
        end
      end
    end
  end
end

Cuba.define do
  on get do
    on 'api' do
      on 'jupiterbroadcasting' do
        on 'usererror' do
          run UserError
        end
        on 'coderradio' do
          run CoderRadio
        end
        on 'linuxactionnews' do
          run LinuxActionNews
        end
        on 'asknoah' do
          run AskNoah
        end
        on 'bsdnow' do
          run BSDNow
        end
      end
    end
  end
end
