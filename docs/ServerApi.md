# ServerApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**ping**](ServerApi.md#ping) | **GET** /server/ping | Ping
[**serverInfo**](ServerApi.md#serverInfo) | **GET** /server/info | System Info



## ping

Ping

Ping, pong. Ping.. pong.

### Example

```bash
 ping
```

### Parameters

This endpoint does not need any parameter.

### Return type

**string**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/text

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## serverInfo

System Info

Perform a system status check and return the options.

### Example

```bash
 serverInfo  super_admin_token=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **superAdminToken** | **integer** | The first time you create a project, the provided token will be saved and required for subsequent project installs. It can also be found and configured in '/config/__api.json' on your server. | [default to null]

### Return type

[**ServerInfo200Response**](ServerInfo200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

