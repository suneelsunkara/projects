resource "aws_api_gateway_deployment" "api" {
 rest_api_id = aws_api_gateway_rest_api.apiGateway.id
 stage_name  = var.environment

 depends_on = [
   aws_api_gateway_integration.api,
 ]

 # Redeploy when there are new updates
 triggers = {
   redeployment = sha1(join(",", list(
     jsonencode(aws_api_gateway_integration.api),
   )))
 }

 lifecycle {
   create_before_destroy = true
 }
}