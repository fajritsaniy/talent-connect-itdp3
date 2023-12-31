pipeline {
    agent any
    environment {
        GIT_URL = "https://github.com/fajritsaniy/talent-connect-itdp3.git"
        BRANCH = "master"
        ROBOT = "/home/user/.local/bin/robot"
        CHANNEL = "#jenkins"
        IMAGE = "my-robot-test"
        CONTAINER = "my-robot-test-app"
        DOCKER_APP = "/usr/bin/docker"
        EMAIL_RECIPIENT = 'fajri2723@gmail.com'
    }
    stages{
        // For Docker Clean up
        stage("Cleaning Up") {
            steps {
                echo "Cleaning up"
                sh "${DOCKER_APP} rm -f ${CONTAINER} || true"
            }
        }
        stage("Clone") {
            steps {
                echo "Clone"
                git branch: "${BRANCH}", url: "${GIT_URL}"
            }
        }
        stage("Build") {
            steps {
                echo "Build"
                sh "${DOCKER_APP} build -t ${IMAGE} ."
            }
        }
        stage("Run"){
            steps {
                echo "Run Test"
                sh "${ROBOT} --outputdir Results Tests/web-version"
            }
        }
    }
    post {
        always {
            echo 'This will always run'
            postNotify(currentBuild.result)
        }
    }
}

def postNotify(buildStatus) {
    notifyEmail(buildStatus)
}

def notifyEmail(buildStatus) {
    def subject
    def body

    if (buildStatus == 'SUCCESS') {
        subject = "Build Successful"
        body = "The build has succeeded."
    } else {
        subject = "Build Failed"
        body = "The build has failed."
    }

    emailext body: body, subject: subject, to: "${EMAIL_RECIPIENT}"
}