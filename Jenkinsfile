pipeline {
    // ✅ Define the build environment using a Docker container
    agent {
        docker { image 'maven:3.8.5-openjdk-17' }
    }

    stages {
        stage('1. Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pavanawatirak308-tech/bookstore-service.git'
            }
        }

        stage('2. Build Application') {
            steps {
                // This will now run inside the Maven container and succeed
                sh 'mvn clean package -DskipTests'
            }
        }

        // NOTE: The next stage will fail because this container doesn't have Docker installed.
        // This is expected and we will fix it in the next step.
        stage('3. Build Docker Image') {
            steps {
                script {
                    def imageName = "bookstore-service:${env.BUILD_NUMBER}"
                    sh "docker build -t ${imageName} ."
                    echo "Successfully built Docker image: ${imageName}"
                }
            }
        }
    }
}