# AWS CloudFormation Deployed IAM Permissions

## Script Execution

The `deploy.sh` script uses GitHub Actions.

1. **Trigger the Workflow**:
   - Go to the **Actions** tab, and select the **Run AWS CLI Script** workflow.
   - Provide a `team_name` value. The possible values for `team_name` are:
     - `development`
     - `security`
     - `service_desk`

2. **CloudFormation Stack Management**:
   - The script checks if a CloudFormation stack exists for the selected team (`development`, `security`, or `service_desk`).
   - If the stack does not exist, a new stack is created.
   - If the stack already exists, the script updates the stack with the latest configuration.

3. **IAM Groups and Policies Creation**:
   - The script will automatically create or update IAM groups and assign them the appropriate policies based on the selected team.

4. **Review Execution**:
   - After the workflow is executed, you can check the logs to see the details of the CloudFormation stack creation or update process.

5. **View the Logs**:
   - Go to the **Actions** tab in GitHub to view the logs and verify that the stack was created or updated successfully.
