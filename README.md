# AWS CloudFormation Deployed IAM Permissions

This script automates the permissions of AWS CloudFormation stacks for different teams within an organisation. It allows to create and update IAM Groups and Policies based on the team specified in the `team_name` variable.

## Usage

1. Set the `team_name` variable to one of the following: `development`, `security`, `service_desk`.
2. Execute the `deploy.sh` script.
3. If CloudFormation Stack does not exist, a new Stack is created.
4. If CloudFormation Stack already exists, update existing Stack.
5. The script will create IAM groups and policies, and the group will be assigned the appropriate policy based on the selected team.

## Script Execution

To execute the script, set the TEAM variable and run the command as shown below:
```
#!/bin/bash
# Set the variable and run the stack
team_name="<value>" ./deploy.sh  # Choose from 'security', 'development', or 'service_desk'
```

Example, to deploy the security team's permissions:
```
team_name="security" ./deploy.sh
```
