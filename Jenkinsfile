pipeline {
    agent any
    stages {
        stage('Compile and Clean') {
            steps {
                // Run Maven on a Unix agent.

                sh "mvn clean compile"
            }
        }
        stage('deploy') {

            steps {
                sh "mvn package"
            }
        }
        stage('Build Docker image'){

            steps {
                echo "Hello Java Express"
                sh 'ls'
                sh 'docker build -t  asadaaron/aws_jenkins_docker:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){

            steps {
                withCredentials([string(credentialsId: 'Dockerid', variable: 'Dockerpwd')]) {
                     sh "docker login -u asadaaron -p ${Dockerpwd}"
                }

            }
        }
        stage('Docker Push'){
            steps {
                sh 'docker push asadaaron/aws_jenkins_docker:${BUILD_NUMBER}'
            }
        }
        stage('Docker deploy'){
            steps {

                sh 'docker run -itd -p  8081:9000 asadaaron/aws_jenkins_docker:${BUILD_NUMBER}'
            }
        }
        stage('Archving') {
            steps {
                 archiveArtifacts '**/target/*.jar'

            }
        }
    }
}
