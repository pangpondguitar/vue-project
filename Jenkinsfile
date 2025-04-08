pipeline {
    agent any

    environment {
        IMAGE_NAME = 'vue-project-image-test'
        TAG = 'latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image from Dockerfile"
                    sh 'ls -la' // debug: ดูว่าไฟล์อยู่ไหม
                    sh """
                        docker build -t ${IMAGE_NAME}:${TAG} .
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    echo "Running Docker container"
                    sh """
                        docker run -d --name vue-project -p 3000:8080 ${IMAGE_NAME}:${TAG}
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
