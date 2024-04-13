pipeline {
    agent any
    
    tools{
        maven 'maven'
    }

    stages {
        stage('Git-Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/srizvi0/Real_World_Jenkins_Proj_E.git'
            }
        }
        stage ('Maven Package'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('OWASP Dependency-Check Vulnerabilities') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
                    --prettyPrint''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
        
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }
        }
        stage ('Docker-Build'){
            steps{
                withDockerRegistry(credentialsId: 'docker-creds', url: "") {
                    sh 'docker build -t image12 .'
                }
            }
        }
        stage ('Docker-tag & Push'){
            steps{
                withDockerRegistry(credentialsId: 'docker-creds', url: "") {
                    sh 'docker tag image12 najamrizvi3/imageproje123578:latest'
                    sh 'docker push najamrizvi3/imageproje123578:latest'
                }
            }
        }
        stage('Install Kubectl'){
            steps{
                sh 'curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.4/2023-05-11/bin/linux/amd64/kubectl'
            }
        }
        
        stage ('Deploy'){
            steps{
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubeconfig-1', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    sh 'aws eks update-kubeconfig --name cluster6 --region us-east-2'
                    sh 'kubectl get ns'       
                    sh 'kubectl apply -f Deployment.yml'
                }
            }
        }
    }
}
