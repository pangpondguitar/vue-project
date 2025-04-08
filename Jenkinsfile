pipeline {
    agent any
    
    environment {
        // ตั้งชื่อ image และ tag
        IMAGE_NAME = 'vue-project-image-test'
        TAG = 'latest'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image from Dockerfile"
                    // คำสั่ง build Docker image
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
                    // คำสั่ง run Docker container
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
