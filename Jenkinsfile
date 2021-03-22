node {
    docker.image.("maven:3.6.3-openjdk-17-slim").inside() {
        stage('Checkout') {
          git 'https://github.com/gantta/RestaurantWeb.git'
        }
        stage('Build') {
          sh 'mvn clean install'
        }
        stage('Code Quality') {
            echo 'Skipping sonarqube b/c I\'m a lazy dev'
          //sh 'mvn sonar:sonar -Dsonar.projectName=SimpleGreetingMaven -Dsonar.projectKey=SimpleGreetingMaven -Dsonar.host.url=http://192.168.4.74:9000 -Dsonar.login=df40ab320de9c9d8ab216f75ebbdd0adaf22449a'
        }
        stage('Build Docker Image'){
            sh 'docker build . -t restaurantweb:latest'
            sh 'docker image ls | grep restaurant'
        }
    }
}