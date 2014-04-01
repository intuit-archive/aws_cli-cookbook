action :update_cname do
  hostname        = new_resource.hostname
  cname           = new_resource.cname
  domain          = new_resource.domain

  cmd = Route53::UpdateCname.new.cname_request  :hostname       => hostname,
                                                :cname          => cname,
                                                :domain         => domain

  new_resource.updated_by_last_action(true)

end
