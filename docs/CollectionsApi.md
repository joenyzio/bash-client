# CollectionsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCollection**](CollectionsApi.md#getCollection) | **GET** /collections/{id} | Retrieve a Collection
[**getCollections**](CollectionsApi.md#getCollections) | **GET** /collections | List Collections



## getCollection

Retrieve a Collection

Retrieves the details of a single collection.

### Example

```bash
 getCollection id=value  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier of the collection. | [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetCollection200Response**](GetCollection200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCollections

List Collections

Returns a list of the collections available in the project.

### Example

```bash
 getCollections  offset=value  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetCollections200Response**](GetCollections200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

