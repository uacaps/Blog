#!/usr/bin/env ruby
require 'optparse'
require 'fileutils'
include FileUtils

options = {}
path = nil
user = nil
repo = nil

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  / Add User /
  opts.on("-u n", "--user", "Github Username") do |u|
    user = u
  end

  / Add Path /
  opts.on("-p n", "--path", "Path from top-level to Post's README.md") do |p|
    path = p.to_s
  end

  / Add Repo Name /
  opts.on("-r n", "--repo", "Repository Name - uses Blog if not set") do |r|
  	repo = r.to_s
  end

end.parse!

/ File IO and Bad Param Handling/
if !path || !user
	puts 'You must have a username (-u) and a path to the Post (-p) to create the blurb'
else
	/ File IO/
  title = ""
  blurb = ""
  i = -1
	File.readlines(path).each do |line|
    i += 1
    if i == 0
      title = line
      title.sub! "\n", ""
    elsif i == 3
      blurb = line
      blurb.sub! "\n", ""
    else
      next
    end
  end

  / Format Variables for Post /
  path.sub! '/README.md', ''
  url = "https://github.com/" + user + "/" + (repo ? repo : "Blog") + "/tree/master/" + path
  formatURL = "### [" + title + "](" + url + ")"
  path.sub! "Posts/",  ""
  pDate = DateTime.strptime(path, '%Y_%m_%d')
  postDateString = pDate.strftime('%A %e %B, %Y')

  / Output /
  puts
  puts
	puts '////////////// POST BLURB //////////////'
	puts
  puts formatURL
	puts 
  puts blurb
	puts
  puts "*Posted* - " + postDateString
  puts
	puts '///////////////////////////////////////'
  puts
  puts
end
