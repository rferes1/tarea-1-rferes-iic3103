require 'net/http'
 

class PagesController < ApplicationController
	def home
		@response = HTTParty.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes')
		@codigo = @response.parsed_response
		@colors = [
			['rgba(53, 92, 125, 1)','rgba(53, 92, 125, 0.6)', 'rgba(53, 92, 125, 0.3)'],
		    ['rgba(163, 111, 72, 1)','rgba(163, 111, 72, 0.6)','rgba(163, 111, 72, 0.3)'],
		    ['rgba(201, 107, 69, 1)','rgba(201, 107, 69, 0.6)','rgba(201, 107, 69, 0.3)'],
		    ['rgba(182, 151, 37, 1)','rgba(182, 151, 37, 0.6)','rgba(182, 151, 37, 0.3)'],
		    ['rgba(32, 48, 106, 1)','rgba(32, 48, 106, 0.6)','rgba(32, 48, 106, 0.3)']]
	end

	def show_episode
		@episode_id = params[:eid]
		@episode_json = HTTParty.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes/#{params[:eid]}").parsed_response[0]
		@colors = [
			['rgba(53, 92, 125, 1)','rgba(53, 92, 125, 0.6)', 'rgba(53, 92, 125, 0.3)'],
		    ['rgba(163, 111, 72, 1)','rgba(163, 111, 72, 0.6)','rgba(163, 111, 72, 0.3)'],
		    ['rgba(201, 107, 69, 1)','rgba(201, 107, 69, 0.6)','rgba(201, 107, 69, 0.3)'],
		    ['rgba(182, 151, 37, 1)','rgba(182, 151, 37, 0.6)','rgba(182, 151, 37, 0.3)'],
		    ['rgba(32, 48, 106, 1)','rgba(32, 48, 106, 0.6)','rgba(32, 48, 106, 0.3)']]

	end

	def show_character
		@episodes_json = HTTParty.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes').parsed_response
		@character_name = params[:character_name]
		@quotes = HTTParty.get("https://tarea-1-breaking-bad.herokuapp.com/api/quote?author=#{params[:character_name]}").parsed_response
		@character_json = HTTParty.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{params[:character_name]}").parsed_response[0]
		@colors = [
			['rgba(53, 92, 125, 1)','rgba(53, 92, 125, 0.6)', 'rgba(53, 92, 125, 0.3)'],
		    ['rgba(163, 111, 72, 1)','rgba(163, 111, 72, 0.6)','rgba(163, 111, 72, 0.3)'],
		    ['rgba(201, 107, 69, 1)','rgba(201, 107, 69, 0.6)','rgba(201, 107, 69, 0.3)'],
		    ['rgba(182, 151, 37, 1)','rgba(182, 151, 37, 0.6)','rgba(182, 151, 37, 0.3)'],
		    ['rgba(32, 48, 106, 1)','rgba(32, 48, 106, 0.6)','rgba(32, 48, 106, 0.3)']]
	end

end
