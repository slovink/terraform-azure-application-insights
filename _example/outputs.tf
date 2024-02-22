output "app_insights_id" {
  value       = module.application-insights.app_insights_id
  description = "the id of the application tnsights component"
}
output "app_insights_app_id" {
  value       = module.application-insights.app_insights_app_id
  description = "the app id associated with this application insights component"
}

output "instrumentation_key" {
  value       = module.application-insights.instrumentation_key
  description = "the instrumentation  key for this application insights component  (sensitive)"
}

output "connection_string" {
  value       = module.application-insights.connection_string
  description = "the connection string for this application instghts component (sensitive)"
}
