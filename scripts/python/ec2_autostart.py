# autostart_ec2_instances - A script to automatically start stopped EC2 instances in a specified AWS region.

import boto3

def autostart_ec2_instances(region_name='us-east-1'):
    """
    Start specified EC2 instances in the given region.

    :param instance_ids: List of EC2 instance IDs to start.
    :param region_name: AWS region where the instances are located.
    """
    ec2 = boto3.client('ec2', region_name=region_name)

#get all instances state
    response = ec2.describe_instances()
    stopped_instances = []

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            state = instance['State']['Name']

            if state == 'stopped':
                stopped_instances.append(instance_id)

    if not stopped_instances:
        print("No stopped instances found.")
        return
    
    print(f"Starting instances: {stopped_instances}")
    print("starting... this may take a few minutes")

    ec2.start_instances(InstanceIds=stopped_instances)
    print("Instances started successfully.")

if __name__ == "__main__":
    autostart_ec2_instances()

    
    """Usage:
    python ec2_autostart.py
    """