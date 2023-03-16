require "sinatra"

get "/" do
  "Num in url pls"
end
get "/:num" do
  @num = params[:num]
  num2 = @num.to_i + 1 
  num2.to_s
end