pipeline {
    agent {
        // docker {
        //      image 'node:6-alpine' 
        //      args '-p 3000:3000' 
        // }
       dockerfile true
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
            
        }
        stage('Environment') {
            steps {
                sh 'git --version'
                echo "Branch: ${env.BRANCH_NAME}"
                sh 'docker -v'
                sh 'printenv'
            }
            
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
    }
    // post {
    //     // Always runs. And it runs before any of the other post conditions.
    //     always {
    //         // Let's wipe out the workspace before we finish!
    //         telegramSend 'Hello World'
    //     }
    // }
}
