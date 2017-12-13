#!/usr/bin/env groovy

node {

    stage('Clone repository') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
    }

    stage('Build image') {
        sh "docker build -t evade/test-node-app:${env.BUILD_NUMBER} ."
    }

    stage('Test image') {
       sh "docker run -i --rm evade/test-node-app:${env.BUILD_NUMBER} ./script/test"
    }

    stage('Push image') {
        sh "summon-conjur docker/docker-hub-password | docker login --username \$(summon-conjur docker/docker-hub-username) --password-stdin"
        sh "docker push evade/test-node-app:${env.BUILD_NUMBER}"
    }
}
