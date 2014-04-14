actions :attach_ebs
default_action :attach_ebs

attribute :volume_id, :kind_of => String, :name_attribute => true
attribute :instance_id, :kind_of => String
attribute :region, :kind_of => String
attribute :device, :kind_of => String, :default => "/dev/xvdh"

