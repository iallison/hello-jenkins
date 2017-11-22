#!/usr/bin/env groovy

pipeline {

  agent any

//    environment {
//         NODE_PATH = "/usr/bin/nodejs"
//     }

  stages {
       stage('Checkout SCM') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'sshkeys', url: 'https://github.com/anshumanbh/hello-jenkins.git']]])
        echo 'Done'
      }
    }

       stage('Test'){

        steps{
         sh 'node -v'
         sh 'npm prune'
         sh 'npm install'
         sh 'npm test'
        }
    }


    // stage('Installing Dependencies') {
    //   steps {
    //       npm install
    //   }
    // }

    //  stage('Testing') {
    //   steps {
    //       sh './script/test'
    //   }
    // }

//     stage('Test Docker image') {
//       steps {
//         sh './test.sh'

//         junit 'spec/reports/*.xml,cucumber/api/features/reports/**/*.xml,cucumber/policy/features/reports/**/*.xml,scaling_features/reports/**/*.xml,reports/*.xml'
//       }
//     }

//     stage('Push Docker image') {
//       steps {
//         sh './push-image.sh'
//       }
//     }

//     stage('Build Debian package') {
//       steps {
//         sh './package.sh'

//         archiveArtifacts artifacts: '*.deb', fingerprint: true
//       }
//     }

//     stage('Publish Debian package'){
//       steps {
//         sh './publish.sh'
//       }
//     }

//     stage('Check website for broken links') {
//       steps {
//         sh './checklinks.sh'
//       }
//     }

//     stage('Publish website - Prod') {
//       when {
//         branch 'master'
//       }
//       steps {
//         sh 'summon ./website.sh'
//       }
//     }

//     stage('Publish Conjur to Heroku') {
//       when {
//         branch 'master'
//       }
//       steps {
//         build job: 'release-heroku', parameters: [string(name: 'APP_NAME', value: 'possum-conjur')]
//       }
//     }
//   }

//   post {
//     always {
//       cleanupAndNotify(currentBuild.currentResult)
//     }
  }
}