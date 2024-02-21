pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage("Git Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/Manikandan-Dharma/CICD-PIPELINE.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        
        // stage('Deploy Ansible and Tomcat') {
          //  steps {
          //      script {
           //         ansiblePlaybook(
           //             playbook: 'install_ansible.yml', 
             //           inventory: '/var/lib/jenkins/workspace/CICD-PIPELINE/SERVER-TOMCAT', 
              //          become: true, 
              //          ansibleName: 'ansible'
               //     )
                //    ansiblePlaybook(
                 //       playbook: 'deploy_tomcat.yml', 
                 //       inventory: '/var/lib/jenkins/workspace/CICD-PIPELINE/SERVER-TOMCAT', 
                  //      become: true, 
                   //     ansibleName: 'ansible'
                 //   )
            //    }
          //  }
      //  }
        stage('Deploy HTTP Server') {
            steps {
                script {
                    // Assuming your EC2 instance has a public IP
                    def ec2PublicIp = sh(script: "terraform output -json public_ip | jq -r .[0]", returnStdout: true).trim()
                    
                    // SSH into the EC2 instance and deploy the HTTP server
                    sh "ssh -i /path/to/your/key.pem ec2-user@${ec2PublicIp} 'sudo yum install -y httpd && sudo systemctl start httpd'"
                }
            }
        }
    }
}
