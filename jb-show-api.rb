require 'cuba'
require 'json'
require 'rss'
require 'open-uri'

class AskNoah < Cuba; end
AskNoah.define do
  on get do
    on root do
      url = 'http://asknoah.fireside.fm/rss'
      open(url) do |rss|
        hash = Hash.new(-1)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          asknoahdata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                          link: item.enclosure.url, desc: item.description }
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
          bsdnowdata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                         link: item.enclosure.url, desc: item.description }
          bsdnowjson = JSON.pretty_generate bsdnowdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(bsdnowjson)
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
        hash = Hash.new(54)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          coderradiodata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                             link: item.enclosure.url, desc: item.description }
          coderradiojson = JSON.pretty_generate coderradiodata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(coderradiojson)
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
          linuxactionnewsdata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                                  link: item.enclosure.url, desc: item.description }
          linuxactionnewsjson = JSON.pretty_generate linuxactionnewsdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(linuxactionnewsjson)
        end
      end
    end
  end
end

class LinuxUnplugged < Cuba; end
LinuxUnplugged.define do
  on get do
    on root do
      url = 'http://feeds.feedburner.com/linuxunplugged'
      open(url) do |rss|
        hash = Hash.new(0)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          linuxunpluggeddata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                                 link: item.enclosure.url, desc: item.description }
          linuxunpluggedjson = JSON.pretty_generate linuxunpluggeddata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(linuxunpluggedjson)
        end
      end
    end
  end
end

class TechSnap < Cuba; end
TechSnap.define do
  on get do
    on root do
      url = 'http://feeds.feedburner.com/techsnapmp3'
      open(url) do |rss|
        hash = Hash.new(190)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          techsnapdata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                           link: item.enclosure.url, desc: item.description }
          techsnapjson = JSON.pretty_generate techsnapdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(techsnapjson)
        end
      end
    end
  end
end

class Unfilter < Cuba; end
Unfilter.define do
  on get do
    on root do
      url = 'http://feeds.feedburner.com/jupiterbroadcasting/unfiltermp3'
      open(url) do |rss|
        hash = Hash.new(39)
        feed = RSS::Parser.parse(rss)
        feed.items.each.reverse_each do |item|
          unfilterdata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                           link: item.enclosure.url, desc: item.description }
          unfilterjson = JSON.pretty_generate unfilterdata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(unfilterjson)
        end
      end
    end
  end
end

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
          usererrordata = { id: hash[:id] += 1, title: item.title, pubDate: item.pubDate,
                            link: item.enclosure.url, desc: item.description }
          usererrorjson = JSON.pretty_generate usererrordata
          res.headers['Content-Type'] = 'application/json; charset=utf-8'
          res.write(usererrorjson)
        end
      end
    end
  end
end

Cuba.define do
  on get do
    on 'api' do
      on 'jupiterbroadcasting' do
        on 'asknoah' do
          run AskNoah
        end
        on 'bsdnow' do
          run BSDNow
        end
        on 'coderradio' do
          run CoderRadio
        end
        on 'linuxactionnews' do
          run LinuxActionNews
        end
        on 'linuxunplugged' do
          run LinuxUnplugged
        end
        on 'techsnap' do
          run TechSnap
        end
        on 'unfilter' do
          run Unfilter
        end
        on 'usererror' do
          run UserError
        end
      end
    end
  end
end
