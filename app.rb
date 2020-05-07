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

  post '/entries' do
    p "Form data submitted to the /entries route!"
    Diary.add(entry: params[:entry])
    redirect('/entries')
  end

  run! if app_file == $0
end
