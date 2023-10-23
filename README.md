# bash_scripting

- The backup script can be used to back up server files or directories to an AWS S3 bucket.
- In order to run this script successfully, the AWS EC2 instance must be attached to a role with the necessary S3 permissions.
- AWS CLI must be installed on EC2
- Setting up this script as a cron job will regularly back up the files you choose.