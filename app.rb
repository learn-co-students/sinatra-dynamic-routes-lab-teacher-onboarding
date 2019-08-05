require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    "#{@number**2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    megaphrase = ""
    @number.times { megaphrase += @phrase }
    megaphrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    words = []
    words.push(params[:word1]).push(params[:word2]).push(params[:word3]).push(params[:word4]).push(params[:word5])
    phrase = words.join(" ")
    phrase += "."
    "#{phrase}"
  end

  get '/:operation/:number1/:number2' do
    operation = params[:operation]
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    if operation == "add"
      "#{num1 + num2}"
    elsif operation == "subtract"
      "#{num1 - num2}"
    elsif operation == "multiply"
      "#{num1 * num2}"
    elsif operation == "divide"
      "#{num1 / num2}"     
    else
      "Invalid operation"
    end
      
  end


end