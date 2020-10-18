pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/nithish407/demo.git'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build -t demo .'
            }
        }
        stage ('Uploading to ECR') {
            steps {
                echo "uploading to docker ECR" 
                sh 'docker tag demo:latest 352950717847.dkr.ecr.ap-south-1.amazonaws.com/demo:latest'
                sh 'docker push 352950717847.dkr.ecr.ap-south-1.amazonaws.com/demo:latest'
            }
        }

        stage ('deploying to GKE') {
           steps {
                echo "deploying imges to GKE"
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl set image deployment/httpd-deployment httpd2=387077262115.dkr.ecr.us-east-2.amazonaws.com/pushtii-ecr-repo:latest'
                sh 'kubectl apply -f test-svc.yaml'
                sh 'kubectl rollout restart deployment/httpd-deployment'
            
           }
    }  
        
}

}
