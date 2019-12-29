## Code deploy readme

#### Configuration steps
1. Create ec2 instance where to deploy the application with params:
    - AMI: ami-01f14919ba412de34
    - IAM role: EC2ServiceRoleTest
    - Tag: 
        - Key: Environment
        - Value: test
    - Security Group ID: sg-08b8874dd81056f3b

2. Install dependencies, install and run code-deploy agent on created instance:
```bash
cd /home/ec2-user
sudo yum -y update
sudo yum -y install ruby
sudo yum -y install java-1.8.0-openjdk
wget https://aws-codedeploy-eu-west-1.s3.eu-west-1.amazonaws.com/latest/install
chmod +x ./install 
sudo ./install auto
sudo service codedeploy-agent status
```
3. Create zip archive (jar + scripts + appspec.yml) and upload to s3 bucket
```bash
aws s3 cp code-deploy-app-ao/app.zip s3://code-deploy-app-ao/app.zip
```
4. Create roles
    - CodeDeploy service role (assume only)
    - EC2 service role (assume + s3 read policy)
5. Create codeDeploy application
6. Create codeDeploy deployment group
7. Create deployment
