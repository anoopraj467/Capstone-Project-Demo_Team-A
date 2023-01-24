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
        stage('terraform build stages') {
            when {
                expression {action == 'apply'}
            }
            steps {
                sh 'terraform fmt'
                sh 'terraform init'
        sh 'terraform validate'
        sh 'terraform plan -var node_count=${NODE_COUNT} -var vm_size=${VM_SIZE} -var sku=${SKU} -out tfplan'
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
