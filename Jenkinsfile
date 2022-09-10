pipeline {
    environment {
        dockerimagename = "nikkihub/myapp"
        dockerImage = ""
    }
    agent any
     tools {
        maven 'Maven' 
        }    
    stages {
        stage ('Checkout Source') {
            steps {
                git 'https://github.com/Bitsify/Java-Tomcat-Jenkings.git'
            }
        }
        stage("Test"){
            steps{
                // mvn test
                sh "mvn test"   
            }
        }
        stage("Build"){
            steps{
                sh "mvn package"  
            }   
        }
        stage('Build image') {
            steps{
                script {
                    dockerImage = docker.build dockerimagename
                }
            }
        }
    }
}
