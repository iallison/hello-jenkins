#!/usr/bin/env groovy

pipeline {

agent any

options {
    timestamps()
    buildDiscarder(logRotator(numToKeepStr: '30'))
    skipDefaultCheckout()  // see 'Checkout SCM' below, once perms are fixed this is no longer needed
}

stages {
    stage('Checkout SCM') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'sshkey', url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
        echo 'Done'
      }
    }

    stage('Building'){
        steps{
            def customImage = docker.build("test")
        }
    }

    stage('Cleanup'){
        steps{
            cleanWs()
        }
    }
  }
}