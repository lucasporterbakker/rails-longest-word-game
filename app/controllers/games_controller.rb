require 'json'
require 'open-uri'

class GamesController < ApplicationController

  RESULTS = {
    1 => { text: "Sorry but #{input}.upcase can't be built out of:"},
    2 => { text: "Sorry but #{input}.upcase does not seem to be a valid English word..."},
    3 => { text: "Congratulations! #{input}.upcase is a valid English word!"}
  }

  def new
    @letters = [*('A'..'Z')].sample(10).each{|letter| puts @letters }
    @instruction = "What is the longest word you can find?"
  end

  def dictionary
    url = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{(params[:word]).to_s}").read)
    url["found"]
  end

  def compare

  end

  def score
    if compare == false
      @result = RESULTS[1][:text]
    elsif dictionary == false
      @result = RESULTS[2][:text]
    else
      @result = RESULTS[3][:text]
    end
  end
end
