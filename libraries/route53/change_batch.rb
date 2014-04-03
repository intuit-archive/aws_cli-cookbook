require "json"

class ChangeBatch
  def initialize(args)

    @hostname     = args[:hostname]
    @record       = args[:record]
    @domain       = args[:domain]
    @record_type  = args[:record_type]
    @TTL          = args[:ttl]
    @change_type  = args[:change_type]
  end

  def create
    {
      "Changes"  => change_type
    }.to_json
  end

  private
  def change_type
  	[
      {
  	    "Actions" =>            @change_type,
        "ResourceRecordSet" =>   record_set
      }
    ]
  end

  def record_set
    {
      "Name" => "#{@record}.#{@domain}",
      "Type" => @record_type,
      "TTL"  => @TTL,
      "ResourceRecords" => record_data
    }
  end

  def record_data
    [
      {
        "Value" => @hostname
      }
    ]
  end

end


