action :update_cname do
  hostname        = new_resource.hostname
  record          = new_resource.record
  domain          = new_resource.domain
  record_type     = new_resource.record_type
  ttl             = new_resource.ttl
  change_type     = new_resource.change_type
  region          = new_resource.region
  hosted_zone_id  = new_resource.hosted_zone_id
  
  cmd = UpdateCname.new.build_command hostname:        = hostname,
                                      record:          = record,
                                      domain:          = domain,
                                      record_type:     = record_type,
                                      ttl:             = ttl,
                                      change_type:     = change_type,
                                      region:          = region, 
                                      hosted_zone_id:  = hosted_zone_id
  
  execute "Updating Route53 Cname Entry: #{record}.#{domain} = #{hostname}" do
    command cmd
  end

  new_resource.updated_by_last_action(true)

end
