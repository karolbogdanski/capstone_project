pipeline {
    
    agent any
    
    environment {
        imageName1 = "113304117666.dkr.ecr.us-east-2.amazonaws.com/worker"
        imageName2 = "113304117666.dkr.ecr.us-east-2.amazonaws.com/seed-data"
        imageName3 = "113304117666.dkr.ecr.us-east-2.amazonaws.com/vote"
        imageName4 = "113304117666.dkr.ecr.us-east-2.amazonaws.com/result"
        registryCredentials = "ecr:us-east-2:aws"
        registry = 'https://113304117666.dkr.ecr.us-east-2.amazonaws.com/'
        dockerImage = ''
    }
    
    stages {
        stage('Code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/testuser681/microservice-sample-app']]])}
        }
    
      // Building Docker images
      stage('Building image') {
        steps{
          script {
            dockerImage1 = docker.build(imageName1, "./worker")
            dockerImage2 = docker.build(imageName2, "./seed-data")
            dockerImage3 = docker.build(imageName3, "./vote")
            dockerImage4 = docker.build(imageName4, "./result")
          }
        }
      }

      // Uploading Docker images into ECR
      stage('Uploading to ECR') {
        steps{  
          script {
            docker.withRegistry(registry, registryCredentials) {
              dockerImage1.push('latest')
              dockerImage2.push('latest')
              dockerImage3.push('latest')
              dockerImage4.push('latest')
            }
          }
        }
      }
    }
}

