pipeline {
    agent any
	environment { 
		GITHUB_TOKEN = credentials('GitHubToken')  
		BRANCH_NAME = "DEFAULT"
		}

    stages {
        stage('Build') {
            steps {
                echo "Building $env.BRANCH_NAME..."
                // Comandos para construir el proyecto
                make build
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Comandos para ejecutar pruebas
                make unit-tests
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Comandos para desplegar el proyecto
                sh 'echo "Desplegando el proyecto..."'
            }
        }
    }

    post {
        always {
            make clean
        }
        success {
            echo 'Success!!!'
        }
        failure {
            echo 'Failure!!!'
        }
    }
}
