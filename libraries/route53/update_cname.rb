module Route53
  class UpdateCname
    def build_command(args)
      hosted_zone_id      = args[:hosted_zone_id]
      region              = args[:region]
      hostname            = args[:hostname]
      cname               = args[:cname]
      domain              = args[:domain]
      record_type         = args[:record_type]
      ttl                 = args[:ttl]
      change_type         = args[:change_type]

      change_batch = Route53.ChangeBatch.new.create   
                                                      :hostname     => hostname
                                                      :cname        => cname
                                                      :domain       => domain
                                                      :record_type  => record_type
                                                      :ttl          => ttl
                                                      :change_type  => change_type

      cmd = "aws route53 change-resource-record-sets"
      cmd = " --hosted-zone-id #{hosted_zone_id}"
      cmd = " --region #{region}"
      cmd = " --change-batch #{change_batch}"  
      #'{"Changes": [{"Action": "UPSERT","ResourceRecordSet": {"Name": "courierdb.courier.cap.a.intuit.com","Type": "CNAME","TTL": 60,"ResourceRecords": [{"Value": "ip-10-80-186-184.us-west-2.compute.internal"}]}}]}'
      cmd
    end
  end
end