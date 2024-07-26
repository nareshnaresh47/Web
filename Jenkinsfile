
pipeline {
    agent any
    




stages{
        stage('Build'){
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ebs']]) {
                    script
					{
                sh '''
                zip -r html.zip *
                
                aws s3 cp html.zip s3://ebs-test1
                '''
                }
				}
            }
          
        }
		        stage('Deploy'){
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ebs']]) {
                    script
					{
                sh '''
                aws elasticbeanstalk create-application-version --application-name ebsweb --version-label ebsweb-${Build_Number} --source-bundle S3Bucket="ebs-test1",S3Key="html.zip"
aws elasticbeanstalk update-environment --environment-name Ebsweb-env --version-label ebsweb-${Build_Number}
                '''
                }
				}
            }
          
        }


    }
}
