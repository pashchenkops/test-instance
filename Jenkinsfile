pipeline {

	agent any 

	tools {
		maven 'Maven-3-8-6'
	}

	stages {
		stage('Build') {
			steps {
				sh 'mvn package -Dmaven.test.skip'
				archiveArtifacts artifacts: '**/target/*.jar'
			}
		}

		stage('Test') {
		    steps {
		        sh 'mvn test'
		    }
		}

		stage('Deploy') {
            steps {
                withCredentials([file(credentialsId: 'AppServerCred', variable: 'KEYS')]) {
                    echo 'copying...'
                    sh 'scp -o StrictHostKeyChecking=no -i $KEYS target/*.jar ec2-user@ec2-54-227-112-114.compute-1.amazonaws.com:~'

                    echo 'running...'
                    sh 'ssh -o StrictHostKeyChecking=no -i $KEYS ec2-user@ec2-54-227-112-114.compute-1.amazonaws.com \'bash -s\' < startup.sh'

                }
            }
        }
	}

	
}