#!/usr/bin/env groovy

node {
    def app

    stage('Clone repository') {
        // checkout scm
        // sh 'key = summon-conjur jenkins/ssh-key'
        // echo '$key'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'summon-conjur jenkins/ssh-key'.execute().text, url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
    }

    stage('Build image') {
        app = docker.build("abhartiya/test-node-app")
    }

    stage('Test image') {
       sh 'docker run -i --rm abhartiya/test-node-app ./script/test'
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'summon-conjur docker/docker-hub-credentials'.execute().text) {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}