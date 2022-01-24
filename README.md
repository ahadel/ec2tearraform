# Challenge:

Please provide an automated solution which:

    1. Creates EC2 instance in AWS
    2. Starts Nginx server on that EC2 with “Hello world” html
    3. Creates AWS EFS and mounts it to the above EC2 instance


You can implement either 1 + 2 or 1 + 3, it's up to you!

# Solution 1+2
1. make sure that you have valid AWS credentials under `default` profile
2. check out the repo and open it in terminal 
3. run `terraform init`
4. run `terraform plan` check the planned resources wchich will be created
5. run `terraform apply` , and note the public ip output `SERVER_IP`

6. use the follwing command to login as ssh to the webserver , the login key will be creeated in the same directory `ssh ubuntu@SERVER_IP -i ./webserverkey.pem`

# TODOS to bea dded
1. private vpn for created resources
2. add subnet fo communication inside subnet