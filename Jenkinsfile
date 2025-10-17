pipeline {
    // Use the main Jenkins agent by default for all stages
    agent any

    stages {
        stage('1. Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pavanawatirak308-tech/bookstore-service.git'
            }
        }

        stage('2. Build Application') {
            // ✅ Specify a different agent ONLY for this stage
            agent {
                docker { image 'maven:3.8.5-openjdk-17' }
            }
            steps {
                // This command will now run inside the temporary Maven container
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('3. Build Docker Image') {
            // This stage runs on the default Jenkins agent, which has Docker access
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