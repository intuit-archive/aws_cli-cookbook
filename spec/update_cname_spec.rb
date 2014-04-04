require 'spec_helper'

describe UpdateCname do
 
  it "returns a proper UpdateCname command" do
    opts = { region:         "us-west-2",
               hostname:       "mylocalhost.com",
               record:         "mynewhostname",
               domain:         "mydomain.com",
               record_type:    "CNAME",
               ttl:            60,
               change_type:    "UPSERT",
               hosted_zone_id: "12345" }

    expect(subject.build_command opts).to eq("aws route53 change-resource-record-sets --hosted-zone-id 12345 --region us-west-2 --change-batch \'{\"Changes\":[{\"Action\":\"UPSERT\",\"ResourceRecordSet\":{\"Name\":\"mynewhostname.mydomain.com\",\"Type\":\"CNAME\",\"TTL\":60,\"ResourceRecords\":[{\"Value\":\"mylocalhost.com\"}]}}]}'")
  end

end
