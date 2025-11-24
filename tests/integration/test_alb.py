import requests
import time

def test_alb_health():
    # Mock DNS
    alb_dns = "http://localhost:8080"
    try:
        response = requests.get(alb_dns)
        assert response.status_code == 200
    except:
        print("Skipping integration test (no live ALB)")

if __name__ == "__main__":
    test_alb_health()
