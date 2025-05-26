
resource "aws_key_pair" "imported_key" {
  key_name   = "rg12"                                                                                                                                                                                                                                                                                                                                                                                         # Name of the key pair in AWS
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSWvYa2kOiC4tkMvXE8TI5WBXhsPXg/YcVtkQJMUDH2AyFpGBMZ/LHKLUbHENmQd/q1bARJZJNmj+xmWvyeBFyQjUR21ybAAJBeAXzamh/a9GciWwePcIv1ZHMr6gs8FOa6XoJmiomeVRseZBNViA9xx2gEqh9Df99ftC6yWPCpI2KquOOnGKXzCrYtq1Iu7du0E04S5XcOFMmx8O5zHYgSjvrg+/UytCuhW0pNTFZdSdkTiKOKHySBItEGeOEUA7jEwnF1pjFPrJT0kCHPyW1h2iI2BnLPyMyntDIJltoj8vbpTCJeaXgasBr/Ghdzkf4pLAczaZfNuETsKf75DiT" # Path to your public key
}
