# UtilitiesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**clearCache**](UtilitiesApi.md#clearCache) | **POST** /utils/cache/clear | Clear Cache
[**export**](UtilitiesApi.md#export) | **POST** /utils/export/{collection} | Export Items
[**hashGenerate**](UtilitiesApi.md#hashGenerate) | **POST** /utils/hash/generate | Hash a string
[**hashVerify**](UtilitiesApi.md#hashVerify) | **POST** /utils/hash/verify | Hash a string
[**import**](UtilitiesApi.md#import) | **POST** /utils/import/{collection} | Import Items
[**random**](UtilitiesApi.md#random) | **GET** /utils/random/string | Get a Random String
[**sort**](UtilitiesApi.md#sort) | **POST** /utils/sort/{collection} | Sort Items



## clearCache

Clear Cache

Resets both the data and schema cache of Empress.

### Example

```bash
 clearCache
```

### Parameters

This endpoint does not need any parameter.

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## export

Export Items

Export a larger data set to a file in the File Library

### Example

```bash
 export collection=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection** | **string** | Collection identifier | [default to null]
 **exportRequest** | [**ExportRequest**](ExportRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## hashGenerate

Hash a string

Generate a hash for a given string.

### Example

```bash
 hashGenerate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hashGenerateRequest** | [**HashGenerateRequest**](HashGenerateRequest.md) |  | [optional]

### Return type

[**HashGenerate200Response**](HashGenerate200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## hashVerify

Hash a string

Generate a hash for a given string.

### Example

```bash
 hashVerify
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hashVerifyRequest** | [**HashVerifyRequest**](HashVerifyRequest.md) |  | [optional]

### Return type

[**HashVerify200Response**](HashVerify200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## import

Import Items

Import multiple records from a JSON or CSV file into a collection.

### Example

```bash
 import collection=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection** | **string** | Collection identifier | [default to null]
 **file** | **binary** |  | [optional] [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## random

Get a Random String

Returns a random string of given length.

### Example

```bash
 random  length=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **length** | **integer** | Length of the random string. | [optional] [default to null]

### Return type

[**Random200Response**](Random200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sort

Sort Items

Re-sort items in collection based on start and to value of item

### Example

```bash
 sort collection=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection** | **string** | Collection identifier | [default to null]
 **sortRequest** | [**SortRequest**](SortRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

