pipeline {
    // ✅ Define the build environment using a Docker container
    agent {
        docker { image 'maven:3.8.5-openjdk-17' }
    }

    stages {
        stage('1. Checkout Code') {
            steps {
                // This command pulls the latest code from your Git repository
                git branch: 'main', url: 'https://github.com/pavanawatirak308-tech/bookstore-service.git'
            }
        }

        stage('2. Build Application') {
            steps {
                // This runs the Maven build to compile the code and create a JAR file
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('3. Build Docker Image') {
            steps {
                script {
                    // This uses the Dockerfile you created to package the application
                    def imageName = "bookstore-service:${env.BUILD_NUMBER}"
                    sh "docker build -t ${imageName} ."
                    echo "Successfully built Docker image: ${imageName}"
                }
            }
        }
    }
}