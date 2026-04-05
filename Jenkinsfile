pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'eu-west-3'
    TF_DIR             = 'terraform'
    ANSIBLE_DIR        = 'ansible'
    PROJECT            = 'jarvis'
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Terraform validate') {
      steps {
        dir(TF_DIR) {
          sh 'terraform init -input=false'
          sh 'terraform validate'
        }
      }
    }

    stage('Terraform plan') {
      when { branch 'main' }
      steps {
        dir(TF_DIR) {
          withCredentials([string(credentialsId: 'db-password', variable: 'DB_PASS')]) {
            sh 'terraform plan -var="db_password=${DB_PASS}" -out=tfplan'
          }
        }
      }
    }

    stage('Terraform apply') {
      when { branch 'main' }
      steps {
        dir(TF_DIR) {
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }

    stage('Ansible deploy') {
      when { branch 'main' }
      steps {
        dir(ANSIBLE_DIR) {
          sh 'ansible-inventory -i inventory/ --list'
          sh 'ansible-playbook -i inventory/ playbooks/deploy.yml'
        }
      }
    }

  }

  post {
    success {
      echo "Deploiement JARViS reussi sur AWS eu-west-3"
    }
    failure {
      echo "Echec du pipeline — verifier les logs ci-dessus"
    }
  }
}
