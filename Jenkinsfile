pipeline {
    agent {
        docker {
              image 'node:8-alpine' 
              args '-p 3000:3000' 
        }
       //dockerfile true
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'yarn install' 
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('JIRA') {
            steps {
                script {
                    echo "Connecting with jira"
                    withEnv(['JIRA_SITE=vbee']) {
                        def serverInfo = jiraGetServerInfo()
                        echo serverInfo.data.toString()
                        
                        def project = jiraGetProject idOrKey: 'VBEE'
                        //echo project.data.toString()
                        
                        def issue = jiraGetIssue idOrKey: 'VBEE-7'
                        echo issue.data.toString()
                    }
                }
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
    post {
        always {
            echo 'This will always run'
            //telegramSend "Jenkins build ${env.BUILD_NUMBER}"
        }
        success {
            echo 'This will run only if successful'
            telegramSend "Build Success: Project: ${env.JOB_NAME} \nBuild Number: ${env.BUILD_NUMBER} \nURL: ${env.BUILD_URL} \nGit Branch: ${env.GIT_BRANCH}"

        }
        failure {
            echo 'Buil failed'
            telegramSend "Build failed: Project: ${env.JOB_NAME} \nBuild Number: ${env.BUILD_NUMBER} \nURL: ${env.BUILD_URL} \nGit Branch: ${env.GIT_BRANCH}"
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
