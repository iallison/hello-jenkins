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
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'sshkeys', url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
        echo 'Done'
      }
    }

       stage('Test'){
        steps{
         sh '/root/.nvm/versions/node/v7.10.1/bin/node -v'
         dir('/var/jenkins_home/workspace/test') {
            sh '/root/.nvm/versions/node/v7.10.1/lib/node_modules/npm install'
            }
        }
    }

    stage('Cleanup'){
        steps{
            cleanWs()
        }
    }
  }
}