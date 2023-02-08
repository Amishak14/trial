library identifier: "pipeline-library@v1.5",
retriever: modernSCM(
  [
    $class: "GitSCMSource",
    remote: "https://github.com/redhat-cop/pipeline-library.git" 
  ]
)

 

 appName1 = "docker-buildconfig"
// appName2= "amisha-expense-tracker-frontend-buildconfig"

 

pipeline {
    agent any
    stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//             }
//         }

        stage("Docker Build backend") {
            steps {
                binaryBuild(buildConfigName: appName, buildFromPath: ".")
            }
        }

       stage("Tag backend image") {
       steps{
    tagImage([
            sourceImagePath: "amisha-jenkins",
            sourceImageName: "amishark/expense-tracker",
            sourceImageTag : "latest",
            toImagePath: "amisha-jenkins",
            toImageName    : "amishark/expense-tracker",
            toImageTag     : "${env.BUILD_NUMBER}"

    ])
       }
       }
      
     
      
//       stage("Tag frontend image") {
//        steps{
//     tagImage([
//             sourceImagePath: "amisha-jenkins",
//             sourceImageName: "expense-tracker-frontend",
//             sourceImageTag : "latest",
//             toImagePath: "amisha-jenkins",
//             toImageName    : "expense-tracker-frontend",
//             toImageTag     : "${env.BUILD_NUMBER}"

//     ])
//        }
//        }
      
//       stage("deploy the application") {
//         steps {
//             script {
//                 openshift.withCluster() {
//                     openshift.withProject("$PROJECT_NAME") {
//                         echo "Using project: ${openshift.project()}"
//                          sh 'sh -x $WORKSPACE/backend-deployment.sh'
//                     }
//                  }
//             }
        } 
    }  
   }   
}   
