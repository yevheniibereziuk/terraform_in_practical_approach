# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  user_data              = file("apache-install.sh")
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}"
  }
}
resource "time_sleep" "wait_90_seconds" {
  depends_on = [aws_instance.my-ec2-vm]
  create_duration = "90s"
}

# Sync App1 Static Content to Webserver using Provisioners
resource "null_resource" "sync_app1_static" {
  depends_on = [ time_sleep.wait_90_seconds ]
  triggers = {
    always-update =  timestamp()
  }

  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = aws_instance.my-ec2-vm.public_ip 
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }  

 # Copies the app1 folder to /tmp
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

# Copies the /tmp/app1 folder to Apache Webserver /var/www/html directory
  provisioner "remote-exec" {
    inline = [
      "sudo cp -r /tmp/app1 /var/www/html"
    ]
  }
}

  #  connecton block for provissioners to connect to EC2 instanc

  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ec2-user"
  #   password    = ""
  #   private_key = file("private-key/terraform-key.pem")
  # }
  # Copies the file-copy.html file to /tmp/file-copy.html
  # provisioner "file" {
  #   source      = "apps/file-copy.html"
  #   destination = "/tmp/file-copy.html"
  # }

  # # Copies the string in content into /tmp/file.log
  # provisioner "file" {
  #   content     = "ami used: ${self.ami}" # Understand what is "self"
  #   destination = "/tmp/file.log"
  # }

  # # Copies the app1 folder to /tmp - FOLDER COPY
  # provisioner "file" {
  #   source      = "apps/app1"
  #   destination = "/tmp"
  # }

  # # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
  # provisioner "file" {
  #   source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
  #   destination = "/tmp"
  # }


  # # Copies the file-copy.html file to /tmp/file-copy.html
  # provisioner "file" {
  #   source      = "apps/file-copy.html"
  #   destination = "/tmp/file-copy.html"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
  #     "sudo cp /tmp/file-copy.html /var/www/html",
  #     "sudo rm -rf /var/www/html/index.html"
  #   ]
  # }

  #  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.my-ec2-vm.private_ip} >> creation-time-private-ip.txt"
  #   working_dir = "local-exec-output-files/"
  #   #on_failure = continue
  # }

  # # local-exec provisioner - (Destroy-Time Provisioner - Triggered during Destroy Resource)
  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "echo Destroy-time provisioner Instanace Destroyed at `date` >> destroy-time.txt"
  #   working_dir = "local-exec-output-files/"
  # }  

