# Building out a Lambda pipeline

## Steps (all from root)
0. Clone this repo
1. Create S3 bucket to store cloudformation templates (it requires S3 URLS)
- ```aws cloudformation deploy --template-file ./1_start/create_s3.yaml --stack-name formationbucket --parameter-overrides CustomBucketName=formationbucket88```
2. Upload cloudformation templates (codepipeline, lambda, gateway, etc.) so we can make changes to our templates
- ```./2_create_pipeline/upload_cloudformation_templates.sh formationbucket88```
- Files will be at https://s3.amazonaws.com/formationbucket88/*.yaml in a public bucket
3. Create pipeline and point it at a github repo (make sure to update the GitHubRepoName/GitHubUser/GitHubToken). The capabilities flag is needed when dealing with things that can affect permissions in your AWS Account (Role, User, Policy, etc.).
- ```aws cloudformation deploy --template-file ./2_create_pipeline/main.yaml --stack-name pipeline --parameter-overrides FormationBucketName=formationbucket88 AppName=epicapp01 GitHubRepoName=aws-ci-cd-poc GitHubUser=ryanjones GitHubToken=xyz --capabilities CAPABILITY_NAMED_IAM  ```
4. Create API Gateway + Lambda in VPC (NAT Gateway?)
- ???
5. Build and deploy website to consume lambda
- ???



## Help
- Delete a stack -> ```aws cloudformation delete-stack --stack-name formationbucket```


## References
- https://github.com/aws-samples/aws-serverless-samfarm