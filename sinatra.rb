#To bind port 80
#sudo socat TCP4-LISTEN:www,reuseaddr,fork TCP4:localhost:8080

require 'sinatra'
require 'sinatra/soap'

set port: 8080

post "/*" do
  while line = request.body.gets
    puts line
  end
end
