module "uk-application" {
  
  source = "../payroll-app"
  app_region = "us-east-1"
  bucket = "nobleprog-1232432"
  ami = "ami-083602cee93914c0c"

}