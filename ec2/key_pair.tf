resource "aws_key_pair" "test_key" { 
  key_name = "test" 
  public_key = file("/Users/hwangjeong-yeon/.ssh/test.pub")
}