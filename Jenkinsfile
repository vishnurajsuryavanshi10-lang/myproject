pipeline {
    agent any
       
    tools {
        maven "Maven-3.9.6"
    }
       
    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/vishnurajsuryavanshi10-lang/myproject.git'   
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'   
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t vishnurajit/mavenwebapp:latest .'   
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push vishnurajit/mavenwebapp:latest'
                }
            }
        }
        stage('k8s Deploy') {
            steps {
                sh 'kubectl apply -f deploy.yml'
                sh 'kubectl rollout status deployment/mavenwebapp-deployment'
                sh 'kubectl get svc mavenwebapp-service'
            }
        }
    }
}
