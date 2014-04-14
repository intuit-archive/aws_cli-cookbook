require 'spec_helper'

describe AttachVolume do
 
  it "returns a proper AWS_Attach_EBS command" do
    opts = { region:         "us-west-2",
               instance_id:  "i-123456",
               volume_id:    "vol-123456",
               device:       "/dev/xvdh" }

    expect(subject.build_command opts).to eq("aws ec2 attach-volume --instance-id i-123456 --volume-id vol-123456 --region us-west-2 --device /dev/xvdh ")
  end

end
