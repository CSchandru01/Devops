 Task-1: Auto start stpped ec2 instances 

    Goal: write a python script using boot3 ( aws sdk for python) that 
        -> lists all ec2 instances in your aws account
        -> check which ones are in a stopped stae
        -> Automatically start them 
        -> print the summary report
 
 Task-2: Auto start Ec2 instances using AWS lambda and CloudWatch Event 

    Goal: every morning at 8.00 AM, Automatically start all ec2 instances that are stopped in your region

        step 1: create the IAM Role for Lambda 
            -> Go to IAM -> role -> Create role
            -> Select AWS services -> Lambda
            -> Attach policies: (as per requirement anf project )

        step 2: Create lambda function
        step 3: pase this python code
        step 4: deploy
        step 5: Schedule it 
            -> CloudWatch -> create rule
            -> Schedule pattern -> cron(30 2 * * ? *)
            -> target -> lambda function -> auto-start-ec2
            -> save -> done
 
 Task-3: write scripy that checks  (health_checkup.py)
    1) cpu Usage
    2) memory Usage
    3) disk Usage
    4) top 5 processes consuming cpu
  and send an aleart only of
    1) cpu > 80%
    2) memoty > 80%
    3) disk > 85%

Task-4) add resource request and limit in k8 deployment
    -> current deployemt.yaml is weak no production-ready app should run without resource policies
        today we fix this 
        