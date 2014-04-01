
module Route53
  class ChangeBatch
    def initialize(args)

      @hostname     = args[:hostname]
      @cname        = args[:cname]
      @domain       = args[:domain]
      @record_type  = args[:record_type]
      @TTL          = args[:ttl]
      @change_type  = args[:change_type]
    end

    def create_change_batch()
      cname_request
    end

    private
    def cname_request()
      {
        "Changes"  => change_types
      }.to_json
    end

    def change_types()
    	{
    	  "Actions"             => change_type,
        "ResourceRecordSet"   => record_types
    	}
    end

    def record_types()
      {
        "Name" => @cname + @domain,
        "Type" => @record_type,
        "TTL"  => @TTL,
        "ResourceRecords" =>  record
      }
    end

    def record_data()
      {
        "Value" => hostname
      }
    end

  end
end

#'{"Changes": [{"Action": "UPSERT","ResourceRecordSet": {"Name": "courierdb.courier.cap.a.intuit.com","Type": "CNAME","TTL": 60,"ResourceRecords": [{"Value": "ip-10-80-186-184.us-west-2.compute.internal"}]}}]}'