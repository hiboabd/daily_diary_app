require 'sinatra/base'


class Diary < Sinatra::Base
  get '/' do
    'Hello World'
  end
end
