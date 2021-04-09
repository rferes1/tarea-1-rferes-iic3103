require 'net/http'
 

class PagesController < ApplicationController
	def home
		@episodes_json = HTTParty.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes').parsed_response
		@bb_arr = []
		@bcs_arr = []
		@episodes_json.each do |episode|
			if episode['series'] == 'Breaking Bad'
				@bb_arr.push(episode['season'])
			elsif episode['series'] == "Better Call Saul"
				@bcs_arr.push(episode['season'])
			end
		end
		@bb_arr = @bb_arr.uniq
		@bcs_arr = @bcs_arr.uniq

		@colors = [
			['rgba(53, 92, 125, 1)','rgba(53, 92, 125, 0.6)', 'rgba(53, 92, 125, 0.3)'],
		    ['rgba(163, 111, 72, 1)','rgba(163, 111, 72, 0.6)','rgba(163, 111, 72, 0.3)'],
		    ['rgba(201, 107, 69, 1)','rgba(201, 107, 69, 0.6)','rgba(201, 107, 69, 0.3)'],
		    ['rgba(182, 151, 37, 1)','rgba(182, 151, 37, 0.6)','rgba(182, 151, 37, 0.3)'],
		    ['rgba(32, 48, 106, 1)','rgba(32, 48, 106, 0.6)','rgba(32, 48, 106, 0.3)']]
	end

	def show_season
		@season_name = params[:season_name]
		@season_id = params[:sid]
		@season_json = HTTParty.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=#{@season_name}").parsed_response
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

	def show_search
		@search = params[:search]
		@results_json = HTTParty.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{params[:search]}").parsed_response
		@colors = [
			['rgba(53, 92, 125, 1)','rgba(53, 92, 125, 0.6)', 'rgba(53, 92, 125, 0.3)'],
		    ['rgba(163, 111, 72, 1)','rgba(163, 111, 72, 0.6)','rgba(163, 111, 72, 0.3)'],
		    ['rgba(201, 107, 69, 1)','rgba(201, 107, 69, 0.6)','rgba(201, 107, 69, 0.3)'],
		    ['rgba(182, 151, 37, 1)','rgba(182, 151, 37, 0.6)','rgba(182, 151, 37, 0.3)'],
		    ['rgba(32, 48, 106, 1)','rgba(32, 48, 106, 0.6)','rgba(32, 48, 106, 0.3)']]


	end

end
