class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :"/songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/show"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genres << Genre.find_by(id: params["genre_ids"])
    @song.save

    if @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    else
      redirect "/songs/new"
    end

  end
end
