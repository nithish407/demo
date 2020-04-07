pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/Sridhar9494/Demo.git'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build -t pushtii-ecr-repo:latest .'
            }
        }
        stage ('Uploading to ECR') {
            steps {
                echo "uploading to docker ECR" 
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 387077262115.dkr.ecr.us-east-2.amazonaws.com/pushtii-ecr-repo'
                sh 'docker tag pushtii-ecr-repo:latest 387077262115.dkr.ecr.us-east-2.amazonaws.com/pushtii-ecr-repo:latest'
                sh 'docker push 387077262115.dkr.ecr.us-east-2.amazonaws.com/pushtii-ecr-repo:latest'
            }
        }

        stage ('deploying to GKE') {
           steps {
                echo "deploying imges to GKE"
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl set image deployment/httpd-deployment httpd2=387077262115.dkr.ecr.us-east-2.amazonaws.com/demo:latest'
                sh 'kubectl apply -f test-svc.yaml'
                sh 'kubectl rollout restart deployment/httpd-deployment'
            
           }
    }  
        
}

}
