Terraform AWS CodeCommit Repository
=============================

A Terraform module for building a CodeCommit repository in line with spin-reference conventions for structure projects.

In particular, assumes you're using the naming convention service/component/estate (explain this).

Consists of:

* Repository
* An IAM policy that allows checking out from the repository, for use by AWS CodePipeline or build agents
* An IAM group for committers. Assign users to this group to allow them to checkout code from the repository.

Usage
-----

To use the module, include something like the following in your terraform configuration:

```hcl-terraform
module "myproject-repository" {
  source  = "xxx.terraform-aws-codecommit-repository"
  region    = "eu-west-1"
  estate_id = "${var.estate_id}"
  component = "${var.component}"
  service   = "${var.role}"
}
```


### Inputs

| Name                         | Description                                                        | Default | Required                           |
|------------------------------|--------------------------------------------------------------------|:-------:|:----------------------------------:|
| region                       | The AWS region into which to provision the repository                  | -       | yes                                |
| service                      | The service whose source code the repository will contain          | -       | yes                                |
| component                    | The component of the service                                       | -       | yes                                |
| estate_id                    | The estate for the component                                       | -       | yes                                |


### Outputs

| Name                         | Description                                                       |
|------------------------------|-------------------------------------------------------------------|
| checkout_policy_arn          | ARN for the policy that allows checkouts, for use by CodePipeline |
| committer_group_name         | Name of the IAM group for users with commit access                |
| clone_url_ssh                | URL for cloning the repository with SSH                           |



### Required Permissions



Development
-----------

### Machine Requirements

In order for the build to run correctly, a few tools will need to be installed on your
development machine:

* tool name goes here


#### Vagrant infra-workbox


### Running the build


TODO:
-----

* Tighten the IAM policies so they only allow access to the repository created.


Contributing
------------

Bug reports and pull requests are welcome on GitHub at (URL goes here). 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to 
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


License
-------

The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


