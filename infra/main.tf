resource "aws_launch_template" "lt" {
  image_id               = "ami-02dfbd4ff395f2a1b"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  name                   = "my-launch-template"
  tags = {
    env = "dev"
  }
  key_name = "venkat"
}

resource "aws_autoscaling_group" "asg" {
  name             = "my-asg"
  max_size         = 3
  min_size         = 1
  desired_capacity = 2
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "terraform-ansible"
    propagate_at_launch = true
  }
  health_check_type = "EC2"
  vpc_zone_identifier = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-1.id]
}
resource "aws_elb" "elb" {
  name            = "my-elb"
  security_groups = [aws_security_group.sg.id]
  subnets         = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-1.id]
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

}