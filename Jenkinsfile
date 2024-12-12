pipeline {
    agent any
	environment { 
	
		GITHUB_TOKEN = credentials('GitHubToken')  
		BRANCH_NAME = "DEFAULT"
		}

    stages {
        stage('Build') {
            steps {
                echo 'Building $BRANCH_NAME...'
                // Comandos para construir el proyecto
                sh 'echo "Compilando el proyecto..."'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Comandos para ejecutar pruebas
                sh 'echo "Ejecutando pruebas..."'
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
            echo 'This will always run'
        }
        success {
            echo 'This will run only if the pipeline succeeds'
        }
        failure {
            echo 'This will run only if the pipeline fails'
        }
    }
}
