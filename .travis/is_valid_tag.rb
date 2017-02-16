#!/usr/bin/env ruby

require_relative '../lib/whatmask/version.rb'

travis_tag = ARGV[0]

if Whatmask::VERSION != travis_tag then
  STDERR.puts "Tag \"#{travis_tag}\" does not match version.rb (#{Whatmask::VERSION})"
  exit 1
else
  exit 0
end
