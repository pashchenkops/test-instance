pipeline {

	agent any 

	tools {
		maven 'Maven-3-8-6'
	}

	stages {
		stage('Build') {
			steps {
				sh 'mvn package -Dmaven.test.skip'
				archiveArtifacts artifacts '**/target/*.jar'
			}
		}

		stage('Test') {
		    steps {
		        sh 'mvn-test'
		    }
		}
	}

	
}