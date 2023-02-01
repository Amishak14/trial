library identifier: "pipeline-library@v1.5",
retriever: modernSCM(
  [
    $class: "GitSCMSource",
    remote: "https://github.com/redhat-cop/pipeline-library.git" 
  ]
)

 

appName = "expense-tracker"

 

pipeline {
    agent any
    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Docker build backend"){
            steps {
                binaryBuild(buildConfigName: appName, buildFromPath: ".")
            }
        }

       stage("Tag image") {
       steps{
    tagImage([
            sourceImagePath: "amisha-jenkins",
            sourceImageName: "expense-tracker-backend",
            sourceImageTag : "latest",
            toImagePath: "amisha-jenkins",
            toImageName    : "expense-tracker-backend",
            toImageTag     : "${env.BUILD_NUMBER}"

    ])
       }
}
