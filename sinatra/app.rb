require "sinatra"
require 'cowsay'

get "/" do
  "Hello, world!"
end
get "/hello/:name" do
    @greeting_name = params[:name]
    "Hello, #{@greeting_name.capitalize}!"
  end

get "/c2f/:celsius" do 
    @celsius = params[:celsius]
    fahrenheit = @celsius.to_f * 9 / 5 + 32
    fahrenheit.to_s
end
get "/f2c/:fahrenheit" do
    @fahrenheit = params[:fahrenheit]
    celsius = (@fahrenheit.to_f - 32) * 5/9
    celsius.to_s
end
get "/test_:uh" do
    params[:uh]
end
get "/x/:num/:num1" do
  @num = params[:num]
  @num1 = params[:num1]
  num2 = @num.to_i * @num1.to_i 
  num2.to_s
end

get "/+/:num/:num1" do
  @num = params[:num]
  @num1 = params[:num1]
  num2 = @num.to_i + @num1.to_i 
  num2.to_s
end
get "/cowsay/:text" do 
  @text = params[:text]
  talk = Cowsay.say("#{@text}", 'cow')
  talk
end
