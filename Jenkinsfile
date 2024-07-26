
pipeline {
    agent any
    

environment {
	BUILD_NUM="${env.BUILD_NUMBER}"
}


stages{
        stage('Build'){
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ebs']]) {
                    script
					{
                sh '''
                zip -r html.zip *
                ls -lart
                aws s3 cp html.zip s3://beanstalk-html
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
		ls -lart
  pwd
  
                aws elasticbeanstalk create-application-version --application-name ebsweb --version-label ebsweb-${BUILD_NUM} --source-bundle S3Bucket="beanstalk-html",S3Key="html.zip"
aws elasticbeanstalk update-environment --environment-name Ebsweb-env --version-label ebsweb-${BUILD_NUM}
                '''
                }
				}
            }
          
        }


    }
}
