pipeline {
    agent { label 'agentdev' }

    parameters {
        string(name: 'IMAGE_TAG', defaultValue: 'v1.0', description: 'Docker image tag to deploy')
    }
    environment {
        SONAR_HOME = tool "sonar"
    }

    stages {

        stage('Code_Check') {
            steps {
                script {
                    code_check("https://github.com/dev9913/Proshop.git", "main")
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("sonar") {
                sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=proshop  -Dsonar.projectKey=proshop_mern  -X"
                }  
            }
        }


        stage('Frontend_Image_Build') {
            steps {
                script {
                    imagebuild("proshop_frontend", "${params.IMAGE_TAG}", "dev7878","frontend")
                }
            }
        }

        stage('Backend_Image_Build') {
            steps {
                script {
                    imagebuild("proshop_backend", "${params.IMAGE_TAG}", "dev7878","backend")
                }
            }
        }

        stage('Frontend_Image_Push') {
            steps {
                script {
                    dockerpush("proshop_frontend", "${params.IMAGE_TAG}", "dev7878")
                }
            }
        }

        stage('Backend_Image_Push') {
            steps {
                script {
                    dockerpush("proshop_backend", "${params.IMAGE_TAG}", "dev7878")
                }
            }
        }
        
         stage('Scan with Trivy Frontend Image') {
            steps {
                script {
                   // Scan the Docker image
                    sh "trivy image --exit-code 1 --severity HIGH,CRITICAL dev7878/proshop_frontend:${params.IMAGE_TAG}"
                }
            }
         }
           stage('Scan with Trivy Backend Image') {
            steps {
                script {
                   // Scan the Docker image
                    sh "trivy image --exit-code 1 --severity HIGH,CRITICAL dev7878/proshop_backend:${params.IMAGE_TAG}"
                }
            }    
        }
        
    stage('Update K8s Fronted image ') {
            steps {
                script {
                    
                }
            }
        }
    }
}

