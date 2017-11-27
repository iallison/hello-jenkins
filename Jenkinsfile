#!/usr/bin/env groovy

node {
    def app

    stage('Clone repository') {
        sh 'clone.sh'
    }

    stage('Build image') {
        sh 'build.sh'
    }

    stage('Test image') {
       sh 'docker run -i --rm abhartiya/test-node-app ./script/test'
    }

    // stage('Push image') {
    //     sh 'push.sh'
    //     docker.withRegistry('https://registry.hub.docker.com', 'summon-conjur docker/docker-hub-credentials'.execute().text) {
    //         app.push("${env.BUILD_NUMBER}")
    //         app.push("latest")
    //     }
    // }
}