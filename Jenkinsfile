pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t emailtokunaljha/spring-boot-demo:1.0.1 .'
                sh 'docker push emailtokunaljha/spring-boot-demo:1.0.1'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Use Ansible to deploy the updated Docker image to Kubernetes
                ansiblePlaybook(
                    playbook: '/home/ec2-user/ansible/deploy.yml',
                    inventory: '/home/ec2-user/ansible/inventory',
                    extras: "-e image_tag=1.0.1"
                )
            }
        }
    }
}

