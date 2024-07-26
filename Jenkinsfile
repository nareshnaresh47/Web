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


    }
}
