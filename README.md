# AWS CloudSearch

## Infrastructure
Create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

Terraform will also create the search indexes.

## Search

### Upload

Upload the file batch:

```sh
aws cloudsearchdomain upload-documents \
  --endpoint-url $cloudSearchEndpoint \
  --content-type 'application/json' \
  --documents 'movies-batch.json'
```
