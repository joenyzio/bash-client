# AssetsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAsset**](AssetsApi.md#getAsset) | **GET** /assets/{id} | Get an Asset



## getAsset

Get an Asset

Image typed files can be dynamically resized and transformed to fit any need.

### Example

```bash
 getAsset id=value  key=value  transforms=value  download=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The id of the file. | [default to null]
 **key** | **string** | The key of the asset size configured in settings. | [optional] [default to null]
 **transforms** | **string** | A JSON array of image transformations | [optional] [default to null]
 **download** | **boolean** | Download the asset to your computer | [optional] [default to null]

### Return type

**string**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: text/plain, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

