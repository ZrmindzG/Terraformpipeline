pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('terraform-aws-omprasad1')
        AWS_SECRET_ACCESS_KEY = credentials('terraform-aws-omprasad1')
    }
    stages {
        stage('Terraform Initialization') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform --version'
            }
        }
        stage('Terraform initgit') {
            steps {
                echo 'Terraform Initialization is In Progress!'
                sh 'terraform init'
            }
        }

         tage('Terraform plan'){
               steps{
                    echo 'Terraform initilization is in Progress!'
                    sh 'terraform plan -var-file=terraform.tfvars -out=tfplan.txt'
                } 
            }
            stage('approval'){
                when{
                    not{
                        equals expected: true, actual: params.autoapprove
                    }
                }
            }
            steps{
                script{
                    def plan= readFile 'tfplan.txt'
                    input message: "do you want to apply the plan?",
                    parameters: [text(name:'plan',description:'Please review the plan',defaultValue:plan)]
                    
                    }
                }
            }
            stage('Terraform Apply'){
                steps{
                    echo 'Terraform Apply'
                    sh 'terraform apply --auto-approve'
                 }

            } 
        }       
    }
 }

}