require_relative 'config/environment'
require "pry"

class App < Sinatra::Base

  get "/reversename/:name" do
    erb :reverse, locals: {
      reversed_name: params[:name].reverse
    }

  end

  get "/square/:number" do
    (params[:number].to_i ** 2).to_s
  end

  get "/say/:number/:phrase" do
    params[:phrase] * params[:number].to_i
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    "#{[
      params[:word1],
      params[:word2],
      params[:word3],
      params[:word4],
      params[:word5]
    ].join(" ")}."
  end

  get "/:operation/:number1/:number2" do
    self.send(params[:operation], params[:number1].to_i, params[:number2].to_i).to_s
  end

  def add number1, number2
    number1 + number2
  end

  def subtract number1, number2
    number1 - number2
  end

  def multiply number1, number2
    number1 * number2
  end

  def divide number1, number2
    number1 / number2
  end

end
