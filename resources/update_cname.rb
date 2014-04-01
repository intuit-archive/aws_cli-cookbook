actions :update_cname
default_action :update_cname

attribute :hostname, :kind_of => String
attribute :cname, :kind_of => String
attribute :domain, :kind_of => String
attribute :hosted_zone_id, :kind_of => String, :default => nil
attribute :region, :kind_of => String, :default => ec2.region
attribute :record_type, :kind_of => String, :default => "cname"
attribute :ttl, :kind_of => Integer, :default => 60
attribute :change_type, :kind_of => String, :default => "UPSERT"
