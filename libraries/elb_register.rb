class RegisterWithLoadBalancer
  def build_command(args)
    @instance_id    = args[:instance_id]
    @elb_name       = args[:elb_name]
    @region         = args[:region]

    opts =  "--load-balancer-name #{@elb_name} "
    opts += "--instances #{@instance_id} "
    opts += "--region #{@region} "

    "aws elb register-instances-with-load-balancer " + opts
  end
end
