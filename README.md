<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform Azure Application Insights
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create Acr resource on Azure.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.4-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-azure-application-insights/blob/master/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


This Terraform configuration defines an Azure infrastructure using the Azure provider.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a azure-defender.

## Usage
To use this module, you should have Terraform installed and configured for AZURE. This module provides the necessary Terraform configuration
for creating AZURE resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example

```hcl
  # Basic
  module "app-insights" {
  source                             = "https://github.com/slovink/terraform-azure-application-lnsights.git?ref=1.0.0"
  name                               = "app"
  environment                        = "test"
  resource_group_name                = module.resource_group.resource_group_name
  location                           = module.resource_group.resource_group_location
  #   workspace_id                   = module.log-analytics.workspace_id
  application_type = "web"

  ##web test
  web_test_enable   = true
  kind              = "ping"
  frequency         = 300
  timeout           = 60
  list_of_test_urls = ["https://www.google.com", ]
  web_test_name     = ["google", ]

  #### enable diagnostic setting
  log_analytics_workspace_id        = module.log-analytics.workspace_id
}
```
This example demonstrates how to create various AZURE resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs
The following input variables can be configured:

- 'target_resource_id': The ID of the Azure Resource which to enable Advanced Threat Protection on.
- 'enabled':  Should Advanced Threat Protection be enabled on this resource?

## Module Outputs
- 'defender_id': The ID of the Advanced Threat Protection resource.

# Examples
For detailed examples on how to use this module, please refer to the '[example](https://github.com/slovink/terraform-azure-application-insights/blob/master/_example)' directory within this repository.

# License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/slovink/terraform-azure-application-insights/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.87.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.87.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >=3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git@github.com:slovink/terraform-azure-labels.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_application_insights_web_test.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights_web_test) | resource |
| [azurerm_monitor_diagnostic_setting.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [random_uuid.parent](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [random_uuid.test_guids](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Metric_enable"></a> [Metric\_enable](#input\_Metric\_enable) | Is this Diagnostic Metric enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_application_type"></a> [application\_type](#input\_application\_type) | Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created. | `string` | `"web"` | no |
| <a name="input_category"></a> [category](#input\_category) | The name of a Diagnostic Log Category Group for this Resource. | `string` | `null` | no |
| <a name="input_daily_data_cap_in_gb"></a> [daily\_data\_cap\_in\_gb](#input\_daily\_data\_cap\_in\_gb) | Specifies the Application Insights component daily data volume cap in GB. | `number` | `30` | no |
| <a name="input_daily_data_cap_notifications_disabled"></a> [daily\_data\_cap\_notifications\_disabled](#input\_daily\_data\_cap\_notifications\_disabled) | Optional) Specifies if a notification email will be send when the daily data volume cap is met. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Purpose/user defined descriptive test for this WebTest. | `string` | `""` | no |
| <a name="input_diagnostic_log_days"></a> [diagnostic\_log\_days](#input\_diagnostic\_log\_days) | The number of days for which this Retention Policy should apply. | `number` | `"90"` | no |
| <a name="input_diagnostic_setting_enable"></a> [diagnostic\_setting\_enable](#input\_diagnostic\_setting\_enable) | n/a | `bool` | `true` | no |
| <a name="input_disable_ip_masking"></a> [disable\_ip\_masking](#input\_disable\_ip\_masking) | By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_footer"></a> [footer](#input\_footer) | n/a | `string` | `"</Items></WebTest>"` | no |
| <a name="input_force_customer_storage_for_profiler"></a> [force\_customer\_storage\_for\_profiler](#input\_force\_customer\_storage\_for\_profiler) | Should the Application Insights component force users to create their own storage account for profiling? Defaults to false. | `bool` | `false` | no |
| <a name="input_frequency"></a> [frequency](#input\_frequency) | Interval in seconds between test runs for this WebTest. Default is 300. | `number` | `300` | no |
| <a name="input_geo_locations"></a> [geo\_locations](#input\_geo\_locations) | Specifies a list of where to physically run the tests from to give global coverage for accessibility of your application. | `list(string)` | <pre>[<br>  "us-ca-sjc-azr",<br>  "us-tx-sn1-azr",<br>  "us-il-ch1-azr",<br>  "us-va-ash-azr",<br>  "us-fl-mia-edge"<br>]</pre> | no |
| <a name="input_header"></a> [header](#input\_header) | n/a | `string` | `"<WebTest Name=\"WebTest1\" Id=\"%s\" Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"0\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"%s\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\"><Items>"` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | (Optional) Should the Application Insights component support ingestion over the Public Internet? Defaults to true. | `bool` | `false` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | (Optional) Should the Application Insights component support querying over the Public Internet? Defaults to true. | `bool` | `false` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | n/a | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_list_of_test_urls"></a> [list\_of\_test\_urls](#input\_list\_of\_test\_urls) | List of URLs to put in the availability tests.  Example: ["https://test1.example.com", "https://test2.example.com/app"] | `list(string)` | `[]` | no |
| <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled) | (Optional) Disable Non-Azure AD based Auth. Defaults to false. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | `null` | no |
| <a name="input_log_enabled"></a> [log\_enabled](#input\_log\_enabled) | Is this Diagnostic Log enabled? Defaults to true. | `string` | `true` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink'. | `string` | `"contact@slovink.com"` | no |
| <a name="input_monitored_enabled"></a> [monitored\_enabled](#input\_monitored\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90. | `number` | `90` | no |
| <a name="input_retention_policy_enabled"></a> [retention\_policy\_enabled](#input\_retention\_policy\_enabled) | Is this Retention Policy enabled? | `bool` | `false` | no |
| <a name="input_retry_enabled"></a> [retry\_enabled](#input\_retry\_enabled) | Allow for retries should this WebTest fail. | `bool` | `true` | no |
| <a name="input_sampling_percentage"></a> [sampling\_percentage](#input\_sampling\_percentage) | Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. | `number` | `100` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the Storage Account where logs should be sent. | `string` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Seconds until this WebTest will timeout and fail. Default is 30. | `number` | `30` | no |
| <a name="input_web_test_enable"></a> [web\_test\_enable](#input\_web\_test\_enable) | n/a | `bool` | `false` | no |
| <a name="input_web_test_name"></a> [web\_test\_name](#input\_web\_test\_name) | n/a | `list(string)` | `[]` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | (Optional) Specifies the id of a log analytics workspace resource. Changing this forces a new resource to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_insights_app_id"></a> [app\_insights\_app\_id](#output\_app\_insights\_app\_id) | The App ID associated with this Application Insights component. |
| <a name="output_app_insights_id"></a> [app\_insights\_id](#output\_app\_insights\_id) | The ID of the Application Insights component. |
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The Connection String for this Application Insights component. (Sensitive) |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | The Instrumentation Key for this Application Insights component. (Sensitive) |
<!-- END_TF_DOCS -->
