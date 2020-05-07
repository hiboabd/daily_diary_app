require 'sinatra/base'
require './lib/diary'

class DiaryManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/redirect' do
    redirect('/confirm')
  end

  get '/confirm' do
    'You have submitted your entry.'
  end

  get '/entries' do
    @entries = Diary.all

    erb(:all_entries)
  end

  run! if app_file == $0
end
