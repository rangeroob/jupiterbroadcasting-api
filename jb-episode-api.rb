require 'cuba'
require 'erb'
require 'json'
require 'rss'
require 'open-uri'

class UserError < Cuba; end
UserError.define do
  on get do
    on root do
      url = 'https://feedpress.me/usererror'
      open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          usererror = item.enclosure.url.to_s.gsub!(%r{(https:\/\/\S+)}, '<li><a href="\1">\1</a></li>')
          res.write(usererror)
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
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          linuxactionnews = item.enclosure.url.to_s.gsub!(%r{(https:\/\/\S+)}, '<li><a href="\1">\1</a></li>')
          res.write(linuxactionnews)
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
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          coderradio = item.enclosure.url.to_s.gsub!(%r{(http:\/\/\S+)}, '<li><a href="\1">\1</a></li>')
          res.write(coderradio)
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
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          asknoah = item.enclosure.url.to_s.gsub!(%r{(https:\/\/\S+)}, '<li><a href="\1">\1</a></li>')
          res.write(asknoah)
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
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          bsdnow = item.enclosure.url.to_s.gsub!(%r{(http:\/\/\S+)}, '<li><a href="\1">\1</a></li>')
          res.write(bsdnow)
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
