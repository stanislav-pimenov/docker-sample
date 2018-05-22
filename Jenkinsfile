#!/usr/bin/env groovy

def baseVersion = '1.0'
def buildVersion = "${baseVersion}.${env.BUILD_NUMBER}"

node('base') {
    checkout scm

    echo '[Jenkins] Environment Variables'
    sh "env"

    stage('Compile') {
        sh 'chmod +x gradlew'
        gradlew('clean', 'classes')
    }

    stage('Test') {
        gradlew('test')
    }

    stage('Build') {
        echo "Building version: ${env.BUILD_ID}"
        gradlew("assemble", "-PbuildVersion=${buildVersion}")
        stash includes: 'Dockerfile,build/libs/*.jar', name: 'artifacts'
    }

    stage('Docker') {
        // todo implement
        echo 'Building docker image....'
        unstash 'artifacts'

    }

    stage('Deploy') {
        // todo implement
        echo 'Deploying...'
    }
}

def gradlew(String... args) {
    sh "./gradlew ${args.join(' ')} -s"
}