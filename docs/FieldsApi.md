# FieldsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCollectionField**](FieldsApi.md#getCollectionField) | **GET** /fields/{collection}/{id} | Retrieve a Field
[**getCollectionFields**](FieldsApi.md#getCollectionFields) | **GET** /fields/{collection} | List Fields in Collection
[**getFields**](FieldsApi.md#getFields) | **GET** /fields | List All Fields



## getCollectionField

Retrieve a Field

Retrieves the details of a single field in a given collection.

### Example

```bash
 getCollectionField collection=value id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection** | **string** | Unique identifier of the collection the item resides in. | [default to null]
 **id** | **string** | Unique identifier of the field. | [default to null]

### Return type

[**GetCollectionField200Response**](GetCollectionField200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCollectionFields

List Fields in Collection

Returns a list of the fields available in the given collection.

### Example

```bash
 getCollectionFields collection=value  Specify as:  sort="value1,value2,..."
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection** | **string** | Unique identifier of the collection the item resides in. | [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]

### Return type

[**GetFields200Response**](GetFields200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getFields

List All Fields

Returns a list of the fields available in the project.

### Example

```bash
 getFields  limit=value  Specify as:  sort="value1,value2,..."
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]

### Return type

[**GetFields200Response**](GetFields200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

