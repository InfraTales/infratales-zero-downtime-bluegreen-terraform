package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBlueGreenDeployment(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../terraform",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "alb_dns_name")
	assert.NotEmpty(t, output)
}
