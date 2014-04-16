require 'spec_helper'

describe AttachVolume do
 
  it "returns a proper AWS_Attach_EBS command" do
    opts = { region:         "us-west-2",
             instance_id:  "i-123456",
             volume_id:    "vol-123456",
             device:       "/dev/xvdh" }

    cmd =  "--instance-id i-123456 "
    cmd += "--volume-id vol-123456 "
    cmd += "--region us-west-2 "
    cmd += "--device /dev/xvdh "  
                        
    expect(subject.build_command opts).to eq("aws ec2 attach-volume " + cmd)
    
  end

end
