# AuthenticationApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](AuthenticationApi.md#login) | **POST** /auth/login | Retrieve a Temporary Access Token
[**logout**](AuthenticationApi.md#logout) | **POST** /auth/logout | Log Out
[**oauth**](AuthenticationApi.md#oauth) | **GET** /auth/oauth | List OAuth Providers
[**oauthProvider**](AuthenticationApi.md#oauthProvider) | **GET** /auth/oauth/{provider} | Authenticated using an OAuth provider
[**passwordRequest**](AuthenticationApi.md#passwordRequest) | **POST** /auth/password/request | Request a Password Reset
[**passwordReset**](AuthenticationApi.md#passwordReset) | **POST** /auth/password/reset | Reset a Password
[**refresh**](AuthenticationApi.md#refresh) | **POST** /auth/refresh | Refresh Token



## login

Retrieve a Temporary Access Token

Retrieve a Temporary Access Token

### Example

```bash
 login
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md) |  | [optional]

### Return type

[**Login200Response**](Login200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## logout

Log Out

Log Out

### Example

```bash
 logout
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logoutRequest** | [**LogoutRequest**](LogoutRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## oauth

List OAuth Providers

List configured OAuth providers.

### Example

```bash
 oauth
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Oauth200Response**](Oauth200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## oauthProvider

Authenticated using an OAuth provider

Start OAuth flow using the specified provider

### Example

```bash
 oauthProvider provider=value  redirect=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **provider** | **string** | Key of the activated OAuth provider. | [default to null]
 **redirect** | **string** | Where to redirect on successful login.<br/>If set the authentication details are set inside cookies otherwise a JSON is returned. | [optional] [default to null]

### Return type

[**OauthProvider200Response**](OauthProvider200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## passwordRequest

Request a Password Reset

Request a reset password email to be send.

### Example

```bash
 passwordRequest
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordRequestRequest** | [**PasswordRequestRequest**](PasswordRequestRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## passwordReset

Reset a Password

The request a password reset endpoint sends an email with a link to the admin app which in turn uses this endpoint to allow the user to reset their password.

### Example

```bash
 passwordReset
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetRequest** | [**PasswordResetRequest**](PasswordResetRequest.md) |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## refresh

Refresh Token

Refresh a Temporary Access Token.

### Example

```bash
 refresh
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md) |  | [optional]

### Return type

[**Refresh200Response**](Refresh200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

