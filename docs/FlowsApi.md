# FlowsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getFlow**](FlowsApi.md#getFlow) | **GET** /flows/{id} | Retrieve a Flow
[**getFlows**](FlowsApi.md#getFlows) | **GET** /flows | List Flows



## getFlow

Retrieve a Flow

Retrieve a single flow by unique identifier.

### Example

```bash
 getFlow id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]

### Return type

[**GetFlow200Response**](GetFlow200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getFlows

List Flows

Get all flows.

### Example

```bash
 getFlows
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetFlows200Response**](GetFlows200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

