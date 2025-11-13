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
