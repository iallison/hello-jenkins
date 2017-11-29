#!/usr/bin/env groovy

node {

    stage('Clone repository') {
        sh "export GIT_SSH_COMMAND='summon-conjur --yaml \"SSH_KEY: !var:file jenkins/ssh-key\" ssh -i \$SSH_KEY'"
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'git@github.com:anshumanbh/hello-jenkins.git']]])
    }

    stage('Build image') {
        sh "docker build -t abhartiya/test-node-app:${env.BUILD_NUMBER} ."
    }

    stage('Test image') {
       sh "docker run -i --rm abhartiya/test-node-app:${env.BUILD_NUMBER} ./script/test"
    }

    stage('Push image') {
        sh "summon-conjur docker/docker-hub-password | docker login --username \$(summon-conjur docker/docker-hub-username) --password-stdin"
        sh "docker push abhartiya/test-node-app:${env.BUILD_NUMBER}"
    }
}