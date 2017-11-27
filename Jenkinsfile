#!/usr/bin/env groovy

node {
    def app

    stage('Clone repository') {
        sh "export GIT_SSH_COMMAND='summon-conjur --yaml \"SSH_KEY: !var:file jenkins/ssh-key\" ssh -i \$SSH_KEY'"
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
    }

    stage('Build image') {
        app = docker.build("abhartiya/test-node-app")
    }

    stage('Test image') {
       sh 'docker run -i --rm abhartiya/test-node-app ./script/test'
    }

    stage('Push image') {
        sh "summon-conjur docker/docker-hub-password | docker login --username $(summon-conjur docker/docker-hub-username) --password-stdin"
        sh "docker push abhartiya/test-node-app:\${env.BUILD_NUMBER}"
    }
}