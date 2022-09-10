pipeline {
    environment {
        dockerimagename = "nikkihub/myapp"
        dockerImage = ""
    }
    agent any
    stages {
        stage ('Checkout Source') {
            steps {
                git 'https://github.com/Bitsify/Java-Tomcat-Jenkings.git'
            }
        }
        stage('Build image') {
            steps{
                script {
                    dockerImage = docker.build dockerimagename
                }
            }
        }
        stage('Pushing Image') {
            environment {
                registryCredential = 'nikkihubdockerhublogin'
            }
            steps{
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}
