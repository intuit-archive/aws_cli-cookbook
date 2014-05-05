actions :register, :deregister
default_action :register

attribute :instance_id, :kind_of => String, :name_attribute => true
attribute :region, :kind_of => String
attribute :elb_name, :kind_of => String
