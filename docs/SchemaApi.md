# SchemaApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**schemaApply**](SchemaApi.md#schemaApply) | **POST** /schema/apply | Apply Schema Difference
[**schemaDiff**](SchemaApi.md#schemaDiff) | **POST** /schema/diff | Retrieve Schema Difference
[**schemaSnapshot**](SchemaApi.md#schemaSnapshot) | **GET** /schema/snapshot | Retrieve Schema Snapshot



## schemaApply

Apply Schema Difference

Update the instance's schema by passing the diff previously retrieved via '/schema/diff' endpoint in the JSON request body or a JSON/YAML file. This endpoint is only available to admin users.

### Example

```bash
 schemaApply
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **schemaApplyRequest** | [**SchemaApplyRequest**](SchemaApplyRequest.md) |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## schemaDiff

Retrieve Schema Difference

Compare the current instance's schema against the schema snapshot in JSON request body or a JSON/YAML file and retrieve the difference. This endpoint is only available to admin users.

### Example

```bash
 schemaDiff  force=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **schemaSnapshot200Response** | [**SchemaSnapshot200Response**](SchemaSnapshot200Response.md) |  |
 **force** | **boolean** | Bypass version and database vendor restrictions. | [optional] [default to null]

### Return type

[**SchemaApplyRequest**](SchemaApplyRequest.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## schemaSnapshot

Retrieve Schema Snapshot

Retrieve the current schema. This endpoint is only available to admin users.

### Example

```bash
 schemaSnapshot  export=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **export** | **string** | Saves the API response to a file. Accepts one of \"csv\", \"json\", \"xml\", \"yaml\". | [optional] [default to null]

### Return type

[**SchemaSnapshot200Response**](SchemaSnapshot200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/yaml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

