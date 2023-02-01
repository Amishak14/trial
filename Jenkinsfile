#! /usr/bin/env groovy

pipeline {
  stages { 
    stage('Create Container Image') {
      steps {
        echo 'Create Container Image..'       
        script {
                openshift.withCluster() { 
                  openshift.withProject("amisha-jenkins") {
                    def buildConfigExists = openshift.selector("bc", "my-poc").exists()   
                    if(!buildConfigExists){ 
                      openshift.newBuild("--name=expense-tracker", "--docker-image=registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7", "--binary") 
                     } 
    
                     openshift.selector("bc", "my-poc").startBuild("--from-file=target/simple-servlet-0.0.1-SNAPSHOT.war", "--follow") } }

       }
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying....'
        script {

         openshift.withCluster() { 
           openshift.withProject("amisha-jenkins") { 
           def deployment = openshift.selector("dc", "my-poc") 
    
         if(!deployment.exists()){ 
          openshift.newApp('expense-tracker', "--as-deployment-config").narrow('svc').expose() 
    } 
   
  } 
}
        }}}

        
