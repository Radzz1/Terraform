resource "local_file" "my_file"{
    filename = "test.txt"
    content = "This is the Test file made with Terraform"
}