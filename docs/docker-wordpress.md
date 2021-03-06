# Docker-Wordpress image

### Instructions:

1. After **terraform apply** get the repository URL
   
    terraform output -json ecr-module | jq .ecr | jq .repository_url

2. Store the url in a variable

    repository_url=$(terraform output -json ecr-module | jq .ecr | jq .repository_url)

3. Retrieve an authentication token and authenticate your Docker client to your registry. Use AWS CLI

    aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin $repository_url

4. Build your Docker image

    docker build -t wp-project3 .

5. After the build completes, tag your image so you can push the image to this repository

    docker tag wp-project3:latest $repository_url/wp-project3:latest

6. Run the following command to push this image to your newly created AWS repository

    docker push $repository_url:latest
    