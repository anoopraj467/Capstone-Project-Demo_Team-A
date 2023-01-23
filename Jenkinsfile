pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        NODE_COUNT = 3
        VM_SIZE = 'Standard_B2s'
        SKU = 'Basic'
    }
    stages {
        stage('terraform format') {
//             when {
//                 expression {action == 'apply'}
//             }
            steps {
                sh 'terraform fmt'
            }
        }
        stage('terraform initialize') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform validate') {
            when {
                expression {action == 'apply'}
            }
            steps{
                sh 'terraform validate'
            }
        }
        stage('terraform plan') {
            when {
                expression {action == 'apply'}
            }
            steps{
                sh 'terraform plan -var node_count=${NODE_COUNT} -var vm_size=${VM_SIZE} -var sku=${SKU} -out tfplan'
            }
        }
        stage('terraform apply') {
            when {
                expression {action == 'apply'}
            }
            steps{
                sh 'terraform apply --auto-approve "tfplan"'
            }
        }
        stage('terraform destroy') {
            when {
                expression {action == 'destroy'}
            }
            steps{
                script {
                    sh 'terraform destroy -var node_count=${NODE_COUNT} -var vm_size=${VM_SIZE} -var sku=${SKU} --auto-approve'
                }
            }
        }
    }
}
