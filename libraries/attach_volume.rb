class AttachVolume
  def build_command(args)
    @instance_id         = args[:instance_id]
    @volume_id           = args[:volume_id]
    @region              = args[:region]
    @device              = args[:device]

    opts =  "--instance-id #{@instance_id} "
    opts += "--volume-id #{@volume_id} "
    opts += "--region #{@region} "
    opts += "--device #{@device} "

    "aws ec2 attach-volume " + opts
  end
end
