pipeline{
    agent any
        environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage('git Checkout'){
            steps{
                git branch: 'master', url: 'https://github.com/NaNi-org/webserver_via_tf.git'
            }
        }
        stage('terrafrom init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('terrafrom plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('terrafrom apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
