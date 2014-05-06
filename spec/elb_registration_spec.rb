require 'spec_helper'

describe RegisterWithLoadBalancer do

  it "returns a proper AWS_CLI_ELB_Register command" do
    opts = { region:         "us-west-2",
             instance_id:  "i-123456",
             elb_name:    "elb-123456"
    }

    cmd =  "--load-balancer-name elb-123456 "
    cmd += "--instances i-123456 "
    cmd += "--region us-west-2 "

    expect(subject.build_command opts).to eq("aws elb register-instances-with-load-balancer " + cmd)

  end

end

describe DeregisterFromLoadBalancer do

  it "returns a proper AWS_CLI_ELB_Deregister command" do
    opts = { region:         "us-west-2",
             instance_id:  "i-123456",
             elb_name:    "elb-123456"
    }

    cmd =  "--load-balancer-name elb-123456 "
    cmd += "--instances i-123456 "
    cmd += "--region us-west-2 "

    expect(subject.build_command opts).to eq("aws elb deregister-instances-from-load-balancer " + cmd)

  end

end
