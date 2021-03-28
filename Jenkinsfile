pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('dev') {
            steps {
                echo 'Hello dev'
            }
        }
        stage('test') {
            steps {
                echo 'Hello test'
            }
        }
        stage('deploy') {
            steps {
                echo 'Hello deploy'
            }
        }
        stage('release') {
            steps {
                echo 'Hello release'
            }
        }
        stage('greating') {
            steps {
                echo 'Hello Black Cloud Geeks'
                git branch: 'main', credentialsId: '84c6a938-5275-4419-ad6b-67282e0f1f8c', url: 'https://github.com/gump334/TerraformVPC'
            }
        }
    }
}
