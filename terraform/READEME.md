
    terraform init -input=false
    
    terraform plan -out=tfplan -input=false  -var-file=config/dev.tfvars
    
    terraform apply -input=false tfplan
    
    terrafrom init -backend-config 'access_key=<>' -backend-config 'secret_key=<>' 