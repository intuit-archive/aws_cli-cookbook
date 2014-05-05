libs = File.expand_path("../../libraries/", __FILE__)

require "#{libs}/attach_volume"
require "#{libs}/change_batch"
require "#{libs}/update_cname"
require "#{libs}/elb_register"
require "#{libs}/elb_deregister"
