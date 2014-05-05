action :register do
  instance_id   = new_resource.instance_id
  elb_name      = new_resource.elb_name
  region        = new_resource.region

  cmd = RegisterWithLoadBalancer.new.build_command instance_id:     instance_id,
                                                   elb_name:        elb_name,
                                                   region:          region

  execute "Register Instance: #{instance_id} to #{elb_name}" do
    command cmd
  end

  new_resource.updated_by_last_action(true)

end

action :deregister do
  instance_id   = new_resource.instance_id
  elb_name      = new_resource.elb_name
  region        = new_resource.region

  cmd = DeregisterFromLoadBalancer.new.build_command instance_id:     instance_id,
                                                     elb_name:        elb_name,
                                                     region:          region

  execute "Deregister Instance: #{instance_id} from #{elb_name}" do
    command cmd
  end

  new_resource.updated_by_last_action(true)

end
