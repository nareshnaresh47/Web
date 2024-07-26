pipeline {
    agent any
    




stages{
        stage('Build'){
            steps {
                sh '''
                zip -r html.zip *
                aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                echo $AWS_ACCESS_KEY_ID
                aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                '''
            }
          
        }


    }
}
