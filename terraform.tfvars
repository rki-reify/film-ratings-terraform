# You may need to edit these variables to match your config
db_password= "password"
ecs_cluster="reify_interview_cluster"
ecs_key_pair_name="dev-tooling-interview-keypair.pem"
region= "us-east-1"
reify_interview_app_image= "mrkiouak/reify-interview:latest"

# no need to change these unless you want to
reify_interview_vpc = "reify_interview_vpc"
reify_interview_network_cidr = "210.0.0.0/16"
reify_interview_public_01_cidr = "210.0.0.0/24"
reify_interview_public_02_cidr = "210.0.10.0/24"
max_instance_size = 3
min_instance_size = 1
desired_capacity = 2
