pipeline{
    agent any
    stages{
        stage('Checkout Code'){
            steps{
               git branch: 'main', url: 'https://github.com/manju9676/Monolithic-terraform-ansible.git'
            }
        }
        stage('Terraform Init'){
            steps{
                dir('infra'){
                   sh 'echo -e "yes\n" | terraform init -migrate-state'
                }
            }
        }
        stage('Terraform Plan'){
            steps{
                dir('infra'){
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply'){
            steps{
                dir('infra'){
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
