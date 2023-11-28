# FilesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFile**](FilesApi.md#createFile) | **POST** /files | Create a File
[**deleteFile**](FilesApi.md#deleteFile) | **DELETE** /files/{id} | Delete a File
[**deleteFiles**](FilesApi.md#deleteFiles) | **DELETE** /files | Delete Multiple Files
[**getFile**](FilesApi.md#getFile) | **GET** /files/{id} | Retrieve a Files
[**getFiles**](FilesApi.md#getFiles) | **GET** /files | List Files
[**updateFile**](FilesApi.md#updateFile) | **PATCH** /files/{id} | Update a File
[**updateFiles**](FilesApi.md#updateFiles) | **PATCH** /files | Update Multiple Files



## createFile

Create a File

Create a new file

### Example

```bash
 createFile
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFileRequest** | [**CreateFileRequest**](CreateFileRequest.md) |  | [optional]

### Return type

[**CreateFile200Response**](CreateFile200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteFile

Delete a File

Delete an existing file.

### Example

```bash
 deleteFile id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteFiles

Delete Multiple Files

Delete multiple existing files.

### Example

```bash
 deleteFiles
```

### Parameters

This endpoint does not need any parameter.

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getFile

Retrieve a Files

Retrieve a single file by unique identifier.

### Example

```bash
 getFile id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**CreateFile200Response**](CreateFile200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getFiles

List Files

List the files.

### Example

```bash
 getFiles  Specify as:  fields="value1,value2,..."  limit=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]
 **filter** | [**array[string]**](string.md) | Select items in collection by given conditions. | [optional] [default to null]
 **search** | **string** | Filter by items that contain the given search query in one of their fields. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetFiles200Response**](GetFiles200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateFile

Update a File

Update an existing file, and/or replace it's file contents.

### Example

```bash
 updateFile id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]
 **file** | [**AnyType**](AnyType.md) | File contents. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **title** | **string** | Title for the file. Is extracted from the filename on upload, but can be edited by the user. | [optional] [default to null]
 **filenameDownload** | **string** | Preferred filename when file is downloaded. | [optional] [default to null]
 **description** | **string** | Description for the file. | [optional] [default to null]
 **folder** | [**UpdateFileRequestFolder**](UpdateFileRequestFolder.md) |  | [optional] [default to null]
 **tags** | [**array[string]**](string.md) | Tags for the file. Is automatically populated based on EXIF data for images. | [optional] [default to null]

### Return type

[**CreateFile200Response**](CreateFile200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: multipart/data, application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateFiles

Update Multiple Files

Update multiple files at the same time.

### Example

```bash
 updateFiles  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]
 **filter** | [**array[string]**](string.md) | Select items in collection by given conditions. | [optional] [default to null]
 **search** | **string** | Filter by items that contain the given search query in one of their fields. | [optional] [default to null]
 **updateFilesRequest** | [**UpdateFilesRequest**](UpdateFilesRequest.md) |  | [optional]

### Return type

[**GetFiles200Response**](GetFiles200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

