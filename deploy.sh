#!/bin/bash
# Version: 1.0.0
# Script to deploy IAM Groups and Policies

# Development Team
development_team() {
    # Check if Stack already exists
    aws cloudformation describe-stacks --stack-name IAMDevelopment > /dev/null 2>&1
    # If yes, update Stack
    if [ $? -eq 0 ]; then
        echo "Stack already exists. Updating Stack."
        aws cloudformation update-stack --stack-name IAMDevelopment \
        --template-body file://development.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    # If no, create stack
    else
        echo "Stack does not exist. Creating Stack."
        aws cloudformation create-stack --stack-name IAMDevelopment \
        --template-body file://development.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    fi
}

# Security Team
security_team() {
    # Check if Stack already exists
    aws cloudformation describe-stacks --stack-name IAMSecurity > /dev/null 2>&1
    # If yes, update Stack
    if [ $? -eq 0 ]; then
        echo "Stack already exists. Updating Stack."
        aws cloudformation update-stack --stack-name IAMSecurity \
        --template-body file://security.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    # If no, create stack
    else
        echo "Stack does not exist. Creating Stack."
        aws cloudformation create-stack --stack-name IAMSecurity \
        --template-body file://security.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    fi
}

# Service Desk Team
service_desk_team() {
    # Check if Stack already exists
    aws cloudformation describe-stacks --stack-name IAMServiceDesk > /dev/null 2>&1
    # If yes, update Stack
    if [ $? -eq 0 ]; then
        echo "Stack already exists. Updating Stack."
        aws cloudformation update-stack --stack-name IAMServiceDesk \
        --template-body file://service-desk.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    # If no, create stack
    else
        echo "Stack does not exist. Creating Stack."
        aws cloudformation create-stack --stack-name IAMServiceDesk \
        --template-body file://service-desk.yaml \
        --capabilities CAPABILITY_NAMED_IAM
    fi
}

# Call function depending on Team variable
if [ "$team_name" = "development" ]; then
    echo "Team is development."
    development_team
elif [ "$team_name" = "security" ]; then
    echo "Team is security."
    security_team
elif [ "$team_name" = "service_desk" ]; then
    echo "Team is service_desk."
    service_desk_team
else
    echo "Team is invalid."
    exit 1
fi
