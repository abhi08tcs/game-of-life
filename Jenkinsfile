pipeline {
    agent { label 'JDK_8' }
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
        stage('git') 
        {
            steps 
            {
                git url: 'https://github.com/abhi08tcs/game-of-life.git',
                    branch: 'master'
                   
            }     
        }
        stage('build')
        {
            steps
            {
               sh 'export PATH="/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH" && mvn package'
            }
        }
        stage('reporting')
        {
            steps
            {
               junit '**/target/surefire-reports/TEST-*.xml'
               archiveArtifacts artifacts: '**/gameoflife.war', followSymlinks: false
               
            }
        }
    }
    post
    {
        success
        {
            mail subject: 'build and package'
                 body: 'No errors are detected'
                 to: 'info@qt.com'
        }
        failure
        {
            mail subject: 'build and package'
                 body: 'error are detected'
                 to: 'info@qt.com'
        }
    }
}