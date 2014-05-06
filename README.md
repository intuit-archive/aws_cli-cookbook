[![Build Status](https://secure.travis-ci.org/intuit/aws_cli-cookbook.png)](http://travis-ci.org/intuit/aws_cli-cookbook)

# aws_cli-cookbook cookbook
Installs AWS command line tools via [AWS CLI Omnibus package](https://github.com/intuit/omnibus-aws_cli)

# Requirements
* Chef 10.x

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
Add the aws_cli cookbook to your role/run_list.

# Attributes
## default
`node['aws_cli']['name']`     - Name of the aws_cli package

`node['aws_cli']['version']`  - Version of aws_cli to install

# Recipes
## default
Installs AWS CLI rpm.


# LWRPs
## update_cname
Adds or updates a CNAME entry in the Route53 specified zone.
## attach_ebs
Attach EBS Volume


### Route53 CNAME
### Actions:
- default action:  `:update_cname`
- `:update_cname`  adds or updates a CNAME entry for the hostname value in the specified domain and hosted zone id


#### required LWRP attributes:

`record`          - Name of the CNAME record to create/update. (:name attribute)

`hostname`        - CNAME Record Hostname Value.

`domain`          - Route53 Hosted Zone Domain Name Value

`hosted_zone_id`  - Route53 Hosted Zone ID

`region`          - AWS region

#### optional

`change_type`  - UPSERT (Default) | CREATE | DELETE

`ttl`          - 60 (Default)

`record_type`  - CNAME (Default) Currently only supports cnames


### Example Add Route53 CNAME Record
```ruby

include_recipe 'aws_cli'

aws_cli_update_cname  "mydb-record" do
  hostname        "ip-1.2.3.4.us-west-1.compute.internal"
  domain          "myapp.com"
  region          "us-west-1"
  hosted_zone_id  "Z234567"
end

```

### Attach EBS Volume
### Actions:
- default action:  `:attach_ebs`
- `:attach_ebs`    attach an existing ebs volume to an instance.

#### required LWRP atributes:

`volume_id`    - EBS volume ID (:name attribute)

`instance_id`  - Instance id to attach volume to 

`region`       - AWS region

#### optional

`device`  -  "/dev/xvdh" (Default)


### Example Attach EBS Volume
```ruby

include_recipe 'aws_cli'

aws_cli_attach_ebs  "vol-123456" do
  instance_id       "i-1234567"
  region            "us-west-1"
  device            "/dev/xvdh"
end

```


### ELB Instance Registration
### Actions:
- default action: `:register`
- `:register`     register an instance to an ELB.
- `:deregister`   deregister an instance to an ELB.

#### required LWRP atributes:

`instance_id`  - Instance ID (:name attribute)

`elb_name`     - ELB name for instance to (de)register to

`region`       - AWS region

### Example register with ELB
```ruby

include_recipe 'aws_cli'

aws_cli_elb_registration "i-123456" do
  elb_name  "elb-preprod-us-west-1-abcdefg"
  region    "us-west-1"
end

```

### Example register with ELB
```ruby

include_recipe 'aws_cli'

aws_cli_elb_registration "i-123456" do
  action    :deregister
  elb_name  "elb-preprod-us-west-1-abcdefg"
  region    "us-west-1"
end

```

# Author
* Capen Brinkley (@capen)
* Grant Hoffman (@grantleehoffman)

