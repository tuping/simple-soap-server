#!/usr/bin/env ruby

require "rubygems"
require "bundler"
require "bundler/setup"
require "sinatra"
require "sinatra/soap"

set port: ARGV[1]

post "/*" do
  while line = request.body.gets
    puts line
  end
end
