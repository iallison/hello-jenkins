#!/usr/bin/env groovy

node {
    def app

    stage('Clone repository') {
        // checkout scm
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'sshkey', url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
    }

    stage('Build image') {
        app = docker.build("test-node-app")
    }

    stage('Test image') {
       sh 'docker run -i --rm test-node-app ./script/test'
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}