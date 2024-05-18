#setup
export AWS_REGION=eu-west-2


#Create the terraform buckets
aws s3api create-bucket \
    --bucket vpn-master-terraform-state \
    --region ${AWS_REGION} \
    --create-bucket-configuration LocationConstraint=${AWS_REGION}



aws dynamodb create-table \
    --table-name vpn-terraform-state-lock \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --tags Key=Owner,Value=Aproximity