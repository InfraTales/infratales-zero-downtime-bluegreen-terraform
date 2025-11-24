#!/bin/bash
yum update -y
yum install -y httpd jq

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat <<HTML > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>InfraTales Green Environment</title>
    <style>
        body { font-family: sans-serif; background-color: #e6ffe6; text-align: center; padding: 50px; }
        .card { background: white; padding: 20px; border-radius: 10px; display: inline-block; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h1 { color: #009933; }
        .meta { color: #666; font-size: 0.9em; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>🟩 Green Environment</h1>
        <p>This is the <strong>Staging/Test</strong> version.</p>
        <div class="meta">
            Instance: <strong>$INSTANCE_ID</strong><br>
            Zone: <strong>$AZ</strong>
        </div>
    </div>
</body>
</html>
HTML

systemctl start httpd
systemctl enable httpd
