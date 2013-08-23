#!/usr/bin/env ruby

/
Copyright (c) 2012 The Board of Trustees of The University of Alabama
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and-or other materials provided with the distribution.
 3. Neither the name of the University nor the names of the contributors
    may be used to endorse or promote products derived from this software
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.
/

require 'optparse'

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
  puts "**Posted** - *" + postDateString +"*"
  puts
	puts '///////////////////////////////////////'
  puts
  puts
end
