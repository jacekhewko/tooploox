pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        sh 'cd /'
        sh 'sudo rm -rf tooploox'
        sh 'git clone https://github.com/jacekhewko/tooploox.git'
      }
    }
    stage('Building image') {
      steps{
        sh "cd tooploox"
        sh "pwd"
        sh "sudo service docker restart"
        sh "sudo docker stop sentry sentry-redis sentry-postgres"
        sh "sudo docker rm sentry sentry-redis sentry-postgres"
        sh "sudo docker-compose up -d"
        sh "seckey=\$(docker-compose run --rm sentry config generate-secret-key)"
        sh "echo 'Y jacek.hewko@gmail.com testpass testpass y' | docker-compose run --rm sentry upgrade"
      }
    }
    stage('Deploy Image') {
      steps{
        echo "test"
      }
    }
    stage('Remove Unused docker image') {
      steps{
        echo "test"
      }
    }
  }
}
