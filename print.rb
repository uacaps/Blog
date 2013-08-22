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
	readme = File.read(path)
  title = ""
  blurb = ""
  url = ""

	puts '////////////// OUTPUT //////////////'
	puts
	puts readme
	puts
	puts '////////////////////////////////////'
end