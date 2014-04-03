require 'rubygems'
require 'yaml'

libs = File.expand_path("../../libraries/route53/", __FILE__)

require "#{libs}/change_batch"
require "#{libs}/update_cname"
