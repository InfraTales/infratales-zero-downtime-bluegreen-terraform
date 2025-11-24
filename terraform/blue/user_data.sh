#!/bin/bash
yum update -y
yum install -y httpd jq

# Get Instance Metadata
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create Index Page
cat <<HTML > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>InfraTales Blue Environment</title>
    <style>
        body { font-family: sans-serif; background-color: #e6f2ff; text-align: center; padding: 50px; }
        .card { background: white; padding: 20px; border-radius: 10px; display: inline-block; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h1 { color: #0066cc; }
        .meta { color: #666; font-size: 0.9em; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>🟦 Blue Environment</h1>
        <p>This is the <strong>Production</strong> version.</p>
        <div class="meta">
            Instance: <strong>$INSTANCE_ID</strong><br>
            Zone: <strong>$AZ</strong>
        </div>
    </div>
</body>
</html>
HTML

# Start Apache
systemctl start httpd
systemctl enable httpd
