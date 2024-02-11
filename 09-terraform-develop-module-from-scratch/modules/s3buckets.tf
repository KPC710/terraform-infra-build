# Call our Custom Terraform Module which we built earlier

module "website_s3_bucket" {
  source      = "./terraform-manifests" # Mandatory
  bucket_name = var.my_s3_bucket
  tags        = var.my_s3_tags
}


# When installing a remote module, Terraform will download it into the .terraform directory in your configuration's root directory.
# When installing a local module, Terraform will instead refer directly to the source directory.
# Because of this, Terraform will automatically notice changes to local modules without having to re-run terraform init or terraform get.