[//]: # (To view this file use: python -m pip install grip; python -m grip -b "readme.md")
[//]: # (https://github.com/settings/tokens)
[//]: # (vim ~/.grip/settings.py)
[//]: # (PASSWORD = 'YOUR-ACCESS-TOKEN')
[//]: # (https://github.com/naokazuterada/MarkdownTOC)
[//]: # (Many thanks to silentcast for animated gif generation: ppa:sethj/silentcast)

# Simple Soap Server - with examples

## Usage

### Required software
* Ruby 2.6.x
* Rubygems

*If you use rvm, you can create an alias for Ruby version:*
```sh
rvm alias create '~>2.6.0' ruby-2.6
```

#### Install required gems:
```sh
bundle install
```

### Run server
From a terminal (*eg. port 8080*):

```sh
./sinatra.rb 8080
```

If you want to redirect to port 80 (*eg. port 8080 -> 80*), run command below in another shell session:
```sh
sudo socat TCP4-LISTEN:www,reuseaddr,fork TCP4:localhost:8080
```
<sup>* You must have *socat* installed.</sup>

## Simple test
If you want to test the server with a simple request, you may try this example:
```sh
curl -v --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:GetVehicleLimitedInfo" --data @request.xml http://localhost/VehicleInfoQueryService.asmx
```

