actions :update_cname
default_action :update_cname

attribute :record, :kind_of => String, :name_attribute => true
attribute :hostname, :kind_of => String
attribute :domain, :kind_of => String
attribute :record_type, :kind_of => String, :default => "CNAME"
attribute :ttl, :kind_of => Integer, :default => 60
attribute :change_type, :kind_of => String, :default => "UPSERT"
attribute :region, :kind_of => String
attribute :hosted_zone_id, :kind_of => String

