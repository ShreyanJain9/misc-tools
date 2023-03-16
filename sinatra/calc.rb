require "sinatra"

get "/" do
  "Num in url pls"
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
