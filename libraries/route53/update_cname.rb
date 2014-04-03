
class UpdateCname
  def build_command(args)
    @hostname            = args[:hostname]
    @record              = args[:record]
    @domain              = args[:domain]
    @record_type         = args[:record_type]
    @ttl                 = args[:ttl]
    @change_type         = args[:change_type]
    @hosted_zone_id      = args[:hosted_zone_id]
    @region              = args[:region]
    
    batch = ChangeBatch.new     hostname:      @hostname,
                                record:        @record,
                                domain:        @domain,
                                record_type:   @record_type,
                                ttl:           @ttl,
                                change_type:   @change_type
  
    change_batch = batch.create

    opts = "--hosted-zone-id #{@hosted_zone_id}"
    opts += " --region #{@region}"
    opts += " --change-batch '#{change_batch}'"  
    
    "aws route53 change-resource-record-sets " + opts
  end
end
