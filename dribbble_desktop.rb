#!/usr/bin/env ruby
require 'fileutils'
require 'pp'
include FileUtils

FileUtils.mkdir_p('images') unless File.exist?('images')
FileUtils.rm_rf('dribbble.html') if File.exist?('dribbble.html')
FileUtils.rm_rf('dribbble.rss') if File.exist?('dribbble.rss')
FileUtils.rm_rf('download_me.txt') if File.exist?('download_me.txt')

ExtractImageRegex = /src=\"([^\"]+)\"/im
DribbleUrl = 'http://dribbble.com/shots/everyone.rss'

system "curl #{DribbleUrl} -o dribbble.rss"

rss = File.readlines('dribbble.rss', 'r').join("").split("<")

all_images, images = [], []
rss.each do |line|
  ExtractImageRegex.match(line)
  all_images << $1
end
all_images.compact!

all_images.each do |i|
  local_file = i.split('/').last
  images << i unless File.exist?("images/#{local_file}")
end

File.open("download_me.txt", "w") do |f|
  f << images.join("\n")
end

system "wget --input-file=download_me.txt --directory-prefix=images"

html = "<html><head>"
html << "<title>Dribble Gallery</title>"
html << "<style>"
html << "body { background-color: #333; width:2800px; overflow: hidden} img {background:#444; padding:5px; border-bottom: 1px solid #999; margin:10px;} #right-mask {position:absolute; right:0; height:1800px; width:150px; background:#000; opacity: 0.7}"
html << "</style>"
html << "</head><body><div id='right-mask'></div>"

Dir["images/*"].each do |file|
  html << "<img src=\"#{file}\" border=\"0\" width=\"400\" height=\"300\" />"     
end

html << "</body></html>"

File.open("dribbble.html", "w") { |f| f << html }