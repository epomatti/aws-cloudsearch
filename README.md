# AWS CloudSearch

## Infrastructure
Create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

Terraform will also create the search indexes.

Connect to the console and enable `Allow open access to the domain` for sandbox only, or give it a policy with fewer permissions. For some reason Terraform is giving a hard time creating it.

## Search

### Upload

Upload the file batch:

```sh
aws cloudsearchdomain upload-documents \
  --endpoint-url $cloudSearchEndpoint \
  --content-type 'application/json' \
  --documents 'movies-batch.json'
```
