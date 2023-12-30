terraform{
    backend "s3" {
        bucket = "busket2"
        key = "global/s3/terraform.ftstate"
        region = "ap-south-1"
      
    }
}