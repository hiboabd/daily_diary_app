require 'sinatra/base'


class Diary < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/redirect' do
    redirect('/confirm')
  end

  get '/confirm' do
    'You have submitted your entry.'
  end
end
