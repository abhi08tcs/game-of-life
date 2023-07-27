pipeline {
    agent { label 'JDK_8' }
    //parameters
    //{
      //  choice (name: 'GOAL' , choices: ['validate', 'compile', 'build', 'deploy', 'package','clean install', 'clean package'], description: 'pick any one of the goals')
    //}
    options
    {
        retry(3)
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers
    {
         pollSCM('* * * * *')
    }
    tools
    {
         jdk 'JDK_8'
    }
    stages
    {
        stage('vcs') 
        {
            steps 
            {
                git url: 'https://github.com/abhi08tcs/game-of-life.git',
                    branch: 'master'
                   
            }     
        }
        stage('build and package')
        {
            steps
            {
               //direct build with maven 
               //sh script: "mvn ${params.GOAL}"

               //configuring with jfrog
               rtMavenDeployer(
                id: "gol_deployer",
                serverId: "MY_JFROG",
                releaseRepo: 'learning-libs-release-local',
                snapshotRepo: 'learning-libs-snapshot-local'
               ) 
               rtMavenRun(
                tool: 'MAVEN_GOF',
                pom: 'pom.xml',
                goals: 'clean install'
                deployerId: "gol_deployer"
               )
               rtPublishBuildInfo (
                    serverId: "MY_JFROG"
                )
            }
        }
        stage('reporting')
        {
            steps
            {
               junit '**/target/surefire-reports/TEST-*.xml'
             
               
            }
        }
    }
   /* post {
        success {
            mail subject: "build and package",
                 body: "your project is effective and your project is running on the node ${NODE_NAME} and the build id is ${BUILD_ID} , and the job is ${JOB_NAME}",
                 to: 'all@qt.com'
        }
        failure {
            mail subject: "build and package",
                 body: "your project is defective and your project is running on the node ${NODE_NAME} and the build id is ${BUILD_ID} , and the job is ${JOB_NAME}",
                 to: 'all@qt.com'
        }
    }*/
}