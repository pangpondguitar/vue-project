pipeline {
    agent {
        docker {
            image 'docker:24.0.7-cli'  // หรือ docker:dind
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = 'vue-project-image-test'
        TAG = 'latest'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${TAG} ."
            }
        }
        stage('Run Docker Container') {
            steps {
                sh "docker run -d --name vue-project-test -p 3000:8080 ${IMAGE_NAME}:${TAG}"
            }
        }
    }
}
