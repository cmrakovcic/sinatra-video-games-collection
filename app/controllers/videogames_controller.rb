class VideogamesController < ApplicationController

  get "/videogames" do
    if !logged_in?
      redirect "/login"
    else
      @videogames = Videogame.all
    erb :"videogames/index"
    end
  end

  get '/videogames/new' do
    erb :"videogames/new"
  end

  post '/videogames' do
      @videogame = Videogame.create(params)
      redirect "/videogames/#{@videogame.id}"
  end

  get '/videogames/:id' do
    @videogame = Videogame.find(params[:id])
    erb :"videogames/show"
  end

  get '/videogames/:id/edit' do
    @videogame = Videogame.find(params[:id])
    erb :"videogames/edit"
  end

  put '/videogames/:id' do
    videogame = Videogame.find(params[:id])
    videogame.update(params[:videogame])
    videogame.save
    redirect "/videogames/#{videogame.id}"
  end

  delete '/videogames/:id' do
    videogame = Videogame.find(params[:id])
    videogame.destroy
    redirect "/videogames"
  end  

  get "/videogames/" do
    redirect "/videogames"
  end
end