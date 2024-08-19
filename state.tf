terraform {
	backend "s3" {
	bucket="cf-templates-bv42advgissg-us-east-1"
	key="state/ec2.tfstate"
	region="us-east-1"
	}
}
