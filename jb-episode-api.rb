require 'cuba'
require 'erb'
require 'json'
require 'uri'
require 'sequel'

DB = Sequel.connect('sqlite://db/jb.db')

class UserError < Cuba; end
UserError.define do
  on get do
    on root, param('episode') do |episode|
      usererror = DB.from(:usererror).where(episode: episode).get(:link)
      user_error_link = "<a href=#{usererror}"">#{usererror}</a>"
      res.write(user_error_link)
    end
  end
end

class LinuxActionNews < Cuba; end
LinuxActionNews.define do
  on get do
    on root, param('episode') do |episode|
      linuxactionnews = DB.from(:linuxactionnews).where(episode: episode).get(:link)
      linux_action_news_link = "<a href=#{linuxactionnews}"">#{linuxactionnews}</a>"
      res.write(linux_action_news_link)
    end
  end
end

class CoderRadio < Cuba; end
CoderRadio.define do
  on get do
    on root, param('episode') do |episode|
      coderradio = DB.from(:coderradio).where(episode: episode).get(:link)
      coder_radio_link = "<a href=#{coderradio}"">#{coderradio}</a>"
      res.write(coder_radio_link)
    end
  end
end

Cuba.define do
  on get do
    on 'api' do
      on 'usererror' do
        run UserError
      end
      on 'coderradio' do
        run CoderRadio
      end
      on 'linuxactionnews' do
        run LinuxActionNews
      end
    end
  end
end
