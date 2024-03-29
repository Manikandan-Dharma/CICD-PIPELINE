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
        
        stage('Deploy HTTP Server') {
    steps {
        script {
            // Fetch the public IP address of the EC2 instance
            def ec2PublicIp = sh(script: "terraform output -json instance_public_ip | jq -r .[0]", returnStdout: true).trim()
            
            // SSH into the EC2 instance and deploy the HTTP server
            sh "ssh -i /path/to/your/key.pem ec2-user@${ec2PublicIp} 'sudo yum install -y httpd && sudo systemctl start httpd'"
        }
    }
}
    }
}
