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
                    // ตรวจสอบว่าไฟล์ถูกเช็คเอาต์มาแล้ว
                    sh 'ls -la'
                    sh """
                        docker build -t ${IMAGE_NAME}:${TAG} .
                    """
                }
            }
        }

        stage('Remove Old Container (if exists)') {
            steps {
                script {
                    echo "Removing existing Docker container (if any)"
                    // ลบ container เก่าถ้ามี
                    sh """
                        docker rm -f vue-project || true
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    echo "Running Docker container"
                    sh """
                        docker run -d --name vue-project -p 3000:80 ${IMAGE_NAME}:${TAG}
                    """
                    // ตรวจสอบว่า container รันแล้ว
                    sh 'docker ps'
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
