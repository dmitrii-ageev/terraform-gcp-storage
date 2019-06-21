GCP STORAGE TERRAFORM MODULE
============================

A terraform module to create a Google Storage bucket and set it properties.


Module Input Variables
----------------------

| Parameter         | Description                                 | Default        |
| :--------         | :----------                                 | :------        |
| `name`            | The name of the bucket                      |  _mandatory_   |
| `project`         | The name of the project                     |  _mandatory_   |
| `labels`          | Labels to stick on the bucket               | `{}`           |
| `iam_member`      | Provide Admin access to this IAM member     | `""`           |
| `location`        | The location where a bucket will be created | us-central1    |
| `storage_class`   | Default storage class                       | MULTI_REGIONAL |
| `versioning`      | Whether to enable versions support or not   | false          |
| `encryption_key`  | The name of the encryption key to use       | `""`           |
| `log_bucket`      | If set, all actions will be logged to the specified bucket          | `""`  |
| `move_to_nearline_in` | The number of days to keep files before moving them to NearLine | 180   |
| `move_to_coldline_in` | The number of days to keep files before moving them to ColdLine | 365   |
| `delete_after`        | The number of days after which files to be deleted"             | 730   |


Usage
-----

```hcl
module "storage" {
  source = "git::git@github.com:dmitrii-ageev/terraform-gcp-storage?ref=0.1.6"

  name     = "terraform-storage-production"
  project  = "${data.google_project.this.project_id}"
  location = "us-east1"

  labels = {
    application = "terraform"
    environment = "production"
  }

  storage_class  = "REGIONAL"
  iam_member     = "domain:mydomain.com"
}
```


Outputs
=======

| Parameter      | Description                                                  |
| :--------      | :----------                                                  |
| `name`         | The name of the bucket                                       |
| `self_link`    | The URI of the created resource                              |
| `url`          | The base URL of the bucket, in the format gs://<bucket-name> |


Author
======

Dmitrii Ageev <d.ageev@gmail.com>
