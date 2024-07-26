
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
                ls -lart
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
						def buildNumber=currentBuild.number
                sh '''
		ls -lart
  pwd
                aws elasticbeanstalk create-application-version --application-name ebsweb --version-label "ebsweb-${buildNumber}" --source-bundle S3Bucket="beanstalk-html",S3Key="html.zip"
aws elasticbeanstalk update-environment --environment-name Ebsweb-env --version-label "ebsweb-${buildNumber}"
                '''
                }
				}
            }
          
        }


    }
}
