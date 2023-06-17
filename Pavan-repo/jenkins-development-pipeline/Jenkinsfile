pipeline {
    agent {
        node {
            label 't056-runner'
        }
    }

    tools {
        maven "maven"
    }

    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = ""
        NEXUS_REPOSITORY = "ce-release"
        NEXUS_REPOGRP_ID = "ce-group"
        NEXUS_CREDENTIAL_ID = "nexuslogin"
        ARTVERSION = "${env.BUILD_ID}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], userRemoteConfigs: [[url: 'https://git.cloudavise.com/visops/t056/jenkins-development-pipeline.git']]])
            }
        }

        stage('BUILD') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                    slackSend channel: '#jenkins', color: 'good', message: "Build stage succeeded!"
                }
                failure {
                    echo 'Build stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Build stage failed!"
                }
            }
        }

        stage('UNIT TEST') {
            steps {
                sh 'mvn test'
            }
            post {
                success {
                    echo 'Unit Test stage succeeded!'
                    slackSend channel: '#jenkins', color: 'good', message: "Unit Test stage succeeded!"
                }
                failure {
                    echo 'Unit Test stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Unit Test stage failed!"
                }
            }
        }

        stage('INTEGRATION TEST') {
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
            post {
                success {
                    echo 'Integration Test stage succeeded!'
                    slackSend channel: '#jenkins', color: 'good', message: "Integration Test stage succeeded!"
                }
                failure {
                    echo 'Integration Test stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Integration Test stage failed!"
                }
            }
        }

        stage('CODE ANALYSIS WITH CHECKSTYLE') {
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                success {
                    echo 'Code Analysis with Checkstyle stage succeeded!'
                    slackSend channel: '#jenkins', color: 'good', message: "Code Analysis with Checkstyle stage succeeded!"
                }
                failure {
                    echo 'Code Analysis with Checkstyle stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Code Analysis with Checkstyle stage failed!"
                }
            }
        }

        stage('CODE ANALYSIS with SONARQUBE') {
            environment {
                scannerHome = tool 'sonarscanner'
            }
            steps {
                sh '''mvn sonar:sonar \
                        -Dsonar.projectKey=ce \
                        -Dsonar.host.url= \
                        -Dsonar.login='''
            }
            post {
                success {
                    echo 'Code Analysis with SonarQube stage succeeded!'
                    slackSend channel: '#jenkins', color: 'good', message: "Code Analysis with SonarQube stage succeeded!"
                }
                failure {
                    echo 'Code Analysis with SonarQube stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Code Analysis with SonarQube stage failed!"
                }
            }
        }

        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml"
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}")
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path
                    artifactExists = fileExists artifactPath
                    if (artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version} ARTVERSION"
                        nexusArtifactUploader(
                            nexusVersion: env.NEXUS_VERSION,
                            protocol: env.NEXUS_PROTOCOL,
                            nexusUrl: env.NEXUS_URL,
                            groupId: env.NEXUS_REPOGRP_ID,
                            version: env.ARTVERSION,
                            repository: env.NEXUS_REPOSITORY,
                            credentialsId: env.NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [
                                    artifactId: pom.artifactId,
                                    classifier: '',
                                    file: artifactPath,
                                    type: pom.packaging
                                ],
                                [
                                    artifactId: pom.artifactId,
                                    classifier: '',
                                    file: "pom.xml",
                                    type: "pom"
                                ]
                            ]
                        )
                    } else {
                        error "*** File: ${artifactPath}, could not be found"
                    }
                }
            }
            post {
                success {
                    echo 'Publish to Nexus Repository Manager stage succeeded!'
                    slackSend channel: '#jenkins', color: 'good', message: "Publish to Nexus Repository Manager stage succeeded!"
                }
                failure {
                    echo 'Publish to Nexus Repository Manager stage failed!'
                    slackSend channel: '#jenkins', color: 'danger', message: "Publish to Nexus Repository Manager stage failed!"
                }
            }
        }
    }
}
