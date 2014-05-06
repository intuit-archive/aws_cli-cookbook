action :attach_ebs do
  instance_id   = new_resource.instance_id
  region        = new_resource.region
  volume_id     = new_resource.volume_id
  device        = new_resource.device

  cmd = AttachVolume.new.build_command instance_id:     instance_id,
                                       region:          region,
                                       volume_id:       volume_id,
                                       device:          device

  execute "Attaching EBS Volume: #{volume_id} to #{instance_id}" do
    command cmd
  end

  new_resource.updated_by_last_action(true)

end
