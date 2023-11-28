# UsersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMe**](UsersApi.md#getMe) | **GET** /users/me | Retrieve Current User
[**getUser**](UsersApi.md#getUser) | **GET** /users/{id} | Retrieve a User
[**getUsers**](UsersApi.md#getUsers) | **GET** /users | List Users
[**updateLastUsedPageMe**](UsersApi.md#updateLastUsedPageMe) | **PATCH** /users/me/track/page | Update Last Page
[**updateMe**](UsersApi.md#updateMe) | **PATCH** /users/me | Update Current User
[**updateUser**](UsersApi.md#updateUser) | **PATCH** /users/{id} | Update a User
[**updateUsers**](UsersApi.md#updateUsers) | **PATCH** /users | Update Multiple Users



## getMe

Retrieve Current User

Retrieve the currently authenticated user.

### Example

```bash
 getMe  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetUser200Response**](GetUser200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUser

Retrieve a User

Retrieve a single user by unique identifier.

### Example

```bash
 getUser id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]

### Return type

[**GetUser200Response**](GetUser200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUsers

List Users

List the users.

### Example

```bash
 getUsers  Specify as:  fields="value1,value2,..."  limit=value  offset=value  meta=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

### Return type

[**GetUsers200Response**](GetUsers200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateLastUsedPageMe

Update Last Page

Updates the last used page field of the currently authenticated user. This is used internally to be able to open the Empress admin app from the last page you used.

### Example

```bash
 updateLastUsedPageMe
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateLastUsedPageMeRequest** | [**UpdateLastUsedPageMeRequest**](UpdateLastUsedPageMeRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateMe

Update Current User

Update the currently authenticated user.

### Example

```bash
 updateMe
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetUser200Response**](GetUser200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateUser

Update a User

Update an existing user

### Example

```bash
 updateUser id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Unique identifier for the object. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **users** | [**Users**](Users.md) |  | [optional]

### Return type

[**ServerInfo200Response**](ServerInfo200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateUsers

Update Multiple Users

Update multiple users at the same time.

### Example

```bash
 updateUsers  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **updateUsersRequest** | [**UpdateUsersRequest**](UpdateUsersRequest.md) |  | [optional]

### Return type

[**GetUsers200Response**](GetUsers200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

