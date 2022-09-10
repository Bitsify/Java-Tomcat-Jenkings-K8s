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
                git 'https://github.com/Bitsify/Java-Tomcat-Jenkings-K8s.git'
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
        stage('Deploying to Kubernetes') {
            steps {
                sh 'ansible-playbook k8s-deploy.yaml'
            }
        }
        }
    }
