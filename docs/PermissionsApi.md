# PermissionsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMyPermissions**](PermissionsApi.md#getMyPermissions) | **GET** /permissions/me | List My Permissions
[**getPermission**](PermissionsApi.md#getPermission) | **GET** /permissions/{id} | Retrieve a Permission
[**getPermissions**](PermissionsApi.md#getPermissions) | **GET** /permissions | List Permissions



## getMyPermissions

List My Permissions

List the permissions that apply to the current user.

### Example

```bash
 getMyPermissions
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetMyPermissions200Response**](GetMyPermissions200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPermission

Retrieve a Permission

Retrieve a single permissions object by unique identifier.

### Example

```bash
 getPermission id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** | Index | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetPermission200Response**](GetPermission200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPermissions

List Permissions

List all permissions.

### Example

```bash
 getPermissions  Specify as:  fields="value1,value2,..."  limit=value  offset=value  meta=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value  page=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]
 **filter** | [**array[string]**](string.md) | Select items in collection by given conditions. | [optional] [default to null]
 **search** | **string** | Filter by items that contain the given search query in one of their fields. | [optional] [default to null]
 **page** | **integer** | Cursor for use in pagination. Often used in combination with limit. | [optional] [default to null]

### Return type

[**GetPermissions200Response**](GetPermissions200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

