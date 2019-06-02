GCP STORAGE TERRAFORM MODULE
============================

A terraform module to create a Google Storage bucket and set it properties.


Module Input Variables
----------------------

| Parameter         | Description                                 | Default        |
| :--------         | :----------                                 | :------        |
| `dependencies`    | A list of resources this module depends on  | `[]`           |
| `name`            | The name of the bucket                      |  _mandatory_   |
| `project`         | The name of the project                     |  _mandatory_   |
| `labels`          | Labels to stick on the bucket               | `{}`           |
| `iam_member`      | Provide Admin access to this IAM member     | `""`           |
| `location`        | The location where a bucket will be created | us-central1    |
| `storage_class`   | Default storage class                       | MULTI_REGIONAL |
| `versioning`      | Whether to enable versions support or not   | false          |
| `encryption_key`  | The name of the encryption key to use       | `""`           |
| `log_bucket`      | If set, all actions will be logged to the specified bucket | `""` |

Usage
-----

```hcl
module "storage" {
  source = "git::git@github.com:dmitrii-ageev/terraform-gcp-storage?ref=0.1.0"

  instance_name = "postgresql"
  network = "${data.google_compute_network.my_network.name}"
}
```


Outputs
=======

| Parameter | Description | Default |
| :-------- | :---------- | :------ |
|  | |



Author
======

Dmitrii Ageev <d.ageev@gmail.com>
