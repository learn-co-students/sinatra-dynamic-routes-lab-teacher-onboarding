require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
      params[:name].reverse
  end

  get '/square/:number' do
      to_square = params[:number].to_i
      squared = to_square ** 2
      squared.to_s
  end

  get '/say/:number/:phrase' do
    to_say = []
    for i in 1..params[:number].to_i do
        to_say << params[:phrase]
    end
    to_say.join(" ")
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
      to_say = []
      for i in 1..5 do
          to_say << params["word#{i}".to_sym]
      end
      said = to_say.join(" ")
      said += "."
      said
  end

  get '/:operation/:number1/:number2' do
      operation = params[:operation]
      number1 = params[:number1]
      number2 = params[:number2]
      sum = 0
      case operation
      when "add"
          sum = number1.to_i + number2.to_i
      when "subtract"
          sum = number1.to_i - number2.to_i
      when "multiply"
          sum = number1.to_i * number2.to_i
      when "divide"
          sum = number1.to_i / number2.to_i
      else
          sum = "Not a valid operation"
      end
      sum.to_s
  end


end
