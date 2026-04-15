pipeline {
agent any

parameters {
    choice(
        name: 'ACTION',
        choices: ['plan', 'apply'],
        description: 'Select Terraform action'
    )
    choice(
        name: 'ENV',
        choices: ['dev', 'uat', 'prod'],
        description: 'Select environment'
    )
    string(
        name: 'BRANCH',
        defaultValue: 'main',
        description: 'Git branch'
    )
}

stages {
    stage('Checkout') {
        steps {
            checkout scmGit(
                branches: [[name: "*/${params.BRANCH}"]],
                userRemoteConfigs: [[url: 'https://github.com/AmarDahiwalkar/Terraform-Automation.git']]
            )
        }
    }

    stage('Terraform Init') {
        steps {
            sh "terraform init -reconfigure"
        }
    }

    stage('Terraform Action') {
        steps {
            script {
                // def tfvarsFile = "${params.ENV}.tfvars"
                def tfvarsFile = "env/${params.ENV}.tfvars"
                if (params.ACTION == 'plan') {
                    echo "Running PLAN for ${params.ENV}"
                    sh "terraform plan -var-file=${tfvarsFile}"
                }

                else if (params.ACTION == 'apply') {
                    echo "Running APPLY for ${params.ENV}"
                    sh "terraform apply -auto-approve -var-file=${tfvarsFile}"
                }
            }
        }
    }
}


}


// pipeline {
//     agent any
//     parameters {
//         choice(
//             name: 'ACTION',
//             choices: ['plan', 'apply'],
//             description: 'Select the action to perform'
//         )
//         string(
//             name: 'BRANCH',
//             defaultValue: 'main',
//             description: 'Enter the branch name to checkout'
//         )
//     }
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scmGit(
//                     branches: [[name: "*/${params.BRANCH}"]],
//                     extensions: [],
//                     userRemoteConfigs: [[url: 'https://github.com/AmarDahiwalkar/Terraform-Automation.git']]
//                 )
//             }
//         }

//         stage("terraform init") {
//             steps {
//                 sh("terraform init -reconfigure")
//             }
//         }

//         stage("Action") {
//             steps {
//                 script {
//                     switch (params.ACTION) {
//                         case 'plan':
//                             echo 'Executing Plan...'
//                             sh "terraform plan"
//                             break
//                         case 'apply':
//                             echo 'Executing Apply...'
//                             sh "terraform apply --auto-approve"
//                             break
//                         default:
//                             error 'Unknown action'
//                     }
//                 }
//             }
//         }
//     }
// }
