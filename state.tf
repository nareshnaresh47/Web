terraform {
	backend "s3" {
	bucket="beanstalk-html"
	key="state/ec2.tfstate"
	region="ap-southeast-1"
	}
}