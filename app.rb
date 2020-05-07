require 'sinatra/base'
require './lib/diary'

class DiaryManager < Sinatra::Base
  get '/entries' do
    @entries = Diary.all

    erb(:all_entries)
  end

  get '/entries/new' do
    erb(:index)
  end

  post '/redirect' do
    redirect('/entries/confirm')
  end

  get '/entries/confirm' do
    'You have submitted your entry.'
  end


  run! if app_file == $0
end
