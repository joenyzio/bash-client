#compdef 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# !
# !
# ! Installation:
# !
# ! Copy the _ file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "createComment[Create a Comment]" \
            "getActivities[List Activity Actions]" \
            "getActivity[Retrieve an Activity Action]"             "getAsset[Get an Asset]"             "login[Retrieve a Temporary Access Token]" \
            "logout[Log Out]" \
            "oauth[List OAuth Providers]" \
            "oauthProvider[Authenticated using an OAuth provider]" \
            "passwordRequest[Request a Password Reset]" \
            "passwordReset[Reset a Password]" \
            "refresh[Refresh Token]"             "getCollection[Retrieve a Collection]" \
            "getCollections[List Collections]"             "getDisplays[List Displays]" \
            "getInterfaces[List Interfaces]" \
            "getLayouts[List Layouts]" \
            "getModules[List Modules]"             "getCollectionField[Retrieve a Field]" \
            "getCollectionFields[List Fields in Collection]" \
            "getFields[List All Fields]"             "createFile[Create a File]" \
            "deleteFile[Delete a File]" \
            "deleteFiles[Delete Multiple Files]" \
            "getFile[Retrieve a Files]" \
            "getFiles[List Files]" \
            "updateFile[Update a File]" \
            "updateFiles[Update Multiple Files]"             "getFlow[Retrieve a Flow]" \
            "getFlows[List Flows]"             "createFolder[Create a Folder]" \
            "deleteFolder[Delete a Folder]" \
            "deleteFolders[Delete Multiple Folders]" \
            "getFolder[Retrieve a Folder]" \
            "getFolders[List Folders]" \
            "updateFolder[Update a Folder]" \
            "updateFolders[Update Multiple Folders]"             "createItemsAccounts[Create an Item]" \
            "createItemsAppointments[Create an Item]" \
            "createItemsBudgets[Create an Item]" \
            "createItemsCampaigns[Create an Item]" \
            "createItemsCarbonFootprint[Create an Item]" \
            "createItemsCompanyAssets[Create an Item]" \
            "createItemsContent[Create an Item]" \
            "createItemsContracts[Create an Item]" \
            "createItemsCrm[Create an Item]" \
            "createItemsDepartment[Create an Item]" \
            "createItemsDistribution[Create an Item]" \
            "createItemsEmailCampaigns[Create an Item]" \
            "createItemsEmployeeDirectory[Create an Item]" \
            "createItemsEnergyEfficiency[Create an Item]" \
            "createItemsEnvironmentalCompliance[Create an Item]" \
            "createItemsEvents[Create an Item]" \
            "createItemsExpenses[Create an Item]" \
            "createItemsFacilities[Create an Item]" \
            "createItemsFeedback[Create an Item]" \
            "createItemsForum[Create an Item]" \
            "createItemsFulfillment[Create an Item]" \
            "createItemsGovernanceandEthics[Create an Item]" \
            "createItemsHelpdesk[Create an Item]" \
            "createItemsInventory[Create an Item]" \
            "createItemsInvoices[Create an Item]" \
            "createItemsInvoicing[Create an Item]" \
            "createItemsLifecycle[Create an Item]" \
            "createItemsLiveChat[Create an Item]" \
            "createItemsLoyalty[Create an Item]" \
            "createItemsMaintenance[Create an Item]" \
            "createItemsPayroll[Create an Item]" \
            "createItemsPerformance[Create an Item]" \
            "createItemsPointofSale[Create an Item]" \
            "createItemsPolicy[Create an Item]" \
            "createItemsProcurement[Create an Item]" \
            "createItemsProductionBatch[Create an Item]" \
            "createItemsProject[Create an Item]" \
            "createItemsPurchaseOrders[Create an Item]" \
            "createItemsQualityCheck[Create an Item]" \
            "createItemsQuotes[Create an Item]" \
            "createItemsRecruit[Create an Item]" \
            "createItemsRegulations[Create an Item]" \
            "createItemsRentals[Create an Item]" \
            "createItemsShipment[Create an Item]" \
            "createItemsSocialMedia[Create an Item]" \
            "createItemsSocialResponsibility[Create an Item]" \
            "createItemsSuppliers[Create an Item]" \
            "createItemsSurveys[Create an Item]" \
            "createItemsSustainableSupplyChain[Create an Item]" \
            "createItemsTaxes[Create an Item]" \
            "createItemsTraining[Create an Item]" \
            "createItemsTransactions[Create an Item]" \
            "deleteItemsAccounts[Delete Multiple Items]" \
            "deleteItemsAppointments[Delete Multiple Items]" \
            "deleteItemsBudgets[Delete Multiple Items]" \
            "deleteItemsCampaigns[Delete Multiple Items]" \
            "deleteItemsCarbonFootprint[Delete Multiple Items]" \
            "deleteItemsCompanyAssets[Delete Multiple Items]" \
            "deleteItemsContent[Delete Multiple Items]" \
            "deleteItemsContracts[Delete Multiple Items]" \
            "deleteItemsCrm[Delete Multiple Items]" \
            "deleteItemsDepartment[Delete Multiple Items]" \
            "deleteItemsDistribution[Delete Multiple Items]" \
            "deleteItemsEmailCampaigns[Delete Multiple Items]" \
            "deleteItemsEmployeeDirectory[Delete Multiple Items]" \
            "deleteItemsEnergyEfficiency[Delete Multiple Items]" \
            "deleteItemsEnvironmentalCompliance[Delete Multiple Items]" \
            "deleteItemsEvents[Delete Multiple Items]" \
            "deleteItemsExpenses[Delete Multiple Items]" \
            "deleteItemsFacilities[Delete Multiple Items]" \
            "deleteItemsFeedback[Delete Multiple Items]" \
            "deleteItemsForum[Delete Multiple Items]" \
            "deleteItemsFulfillment[Delete Multiple Items]" \
            "deleteItemsGovernanceandEthics[Delete Multiple Items]" \
            "deleteItemsHelpdesk[Delete Multiple Items]" \
            "deleteItemsInventory[Delete Multiple Items]" \
            "deleteItemsInvoices[Delete Multiple Items]" \
            "deleteItemsInvoicing[Delete Multiple Items]" \
            "deleteItemsLifecycle[Delete Multiple Items]" \
            "deleteItemsLiveChat[Delete Multiple Items]" \
            "deleteItemsLoyalty[Delete Multiple Items]" \
            "deleteItemsMaintenance[Delete Multiple Items]" \
            "deleteItemsPayroll[Delete Multiple Items]" \
            "deleteItemsPerformance[Delete Multiple Items]" \
            "deleteItemsPointofSale[Delete Multiple Items]" \
            "deleteItemsPolicy[Delete Multiple Items]" \
            "deleteItemsProcurement[Delete Multiple Items]" \
            "deleteItemsProductionBatch[Delete Multiple Items]" \
            "deleteItemsProject[Delete Multiple Items]" \
            "deleteItemsPurchaseOrders[Delete Multiple Items]" \
            "deleteItemsQualityCheck[Delete Multiple Items]" \
            "deleteItemsQuotes[Delete Multiple Items]" \
            "deleteItemsRecruit[Delete Multiple Items]" \
            "deleteItemsRegulations[Delete Multiple Items]" \
            "deleteItemsRentals[Delete Multiple Items]" \
            "deleteItemsShipment[Delete Multiple Items]" \
            "deleteItemsSocialMedia[Delete Multiple Items]" \
            "deleteItemsSocialResponsibility[Delete Multiple Items]" \
            "deleteItemsSuppliers[Delete Multiple Items]" \
            "deleteItemsSurveys[Delete Multiple Items]" \
            "deleteItemsSustainableSupplyChain[Delete Multiple Items]" \
            "deleteItemsTaxes[Delete Multiple Items]" \
            "deleteItemsTraining[Delete Multiple Items]" \
            "deleteItemsTransactions[Delete Multiple Items]" \
            "deleteSingleItemsAccounts[Delete an Item]" \
            "deleteSingleItemsAppointments[Delete an Item]" \
            "deleteSingleItemsBudgets[Delete an Item]" \
            "deleteSingleItemsCampaigns[Delete an Item]" \
            "deleteSingleItemsCarbonFootprint[Delete an Item]" \
            "deleteSingleItemsCompanyAssets[Delete an Item]" \
            "deleteSingleItemsContent[Delete an Item]" \
            "deleteSingleItemsContracts[Delete an Item]" \
            "deleteSingleItemsCrm[Delete an Item]" \
            "deleteSingleItemsDepartment[Delete an Item]" \
            "deleteSingleItemsDistribution[Delete an Item]" \
            "deleteSingleItemsEmailCampaigns[Delete an Item]" \
            "deleteSingleItemsEmployeeDirectory[Delete an Item]" \
            "deleteSingleItemsEnergyEfficiency[Delete an Item]" \
            "deleteSingleItemsEnvironmentalCompliance[Delete an Item]" \
            "deleteSingleItemsEvents[Delete an Item]" \
            "deleteSingleItemsExpenses[Delete an Item]" \
            "deleteSingleItemsFacilities[Delete an Item]" \
            "deleteSingleItemsFeedback[Delete an Item]" \
            "deleteSingleItemsForum[Delete an Item]" \
            "deleteSingleItemsFulfillment[Delete an Item]" \
            "deleteSingleItemsGovernanceandEthics[Delete an Item]" \
            "deleteSingleItemsHelpdesk[Delete an Item]" \
            "deleteSingleItemsInventory[Delete an Item]" \
            "deleteSingleItemsInvoices[Delete an Item]" \
            "deleteSingleItemsInvoicing[Delete an Item]" \
            "deleteSingleItemsLifecycle[Delete an Item]" \
            "deleteSingleItemsLiveChat[Delete an Item]" \
            "deleteSingleItemsLoyalty[Delete an Item]" \
            "deleteSingleItemsMaintenance[Delete an Item]" \
            "deleteSingleItemsPayroll[Delete an Item]" \
            "deleteSingleItemsPerformance[Delete an Item]" \
            "deleteSingleItemsPointofSale[Delete an Item]" \
            "deleteSingleItemsPolicy[Delete an Item]" \
            "deleteSingleItemsProcurement[Delete an Item]" \
            "deleteSingleItemsProductionBatch[Delete an Item]" \
            "deleteSingleItemsProject[Delete an Item]" \
            "deleteSingleItemsPurchaseOrders[Delete an Item]" \
            "deleteSingleItemsQualityCheck[Delete an Item]" \
            "deleteSingleItemsQuotes[Delete an Item]" \
            "deleteSingleItemsRecruit[Delete an Item]" \
            "deleteSingleItemsRegulations[Delete an Item]" \
            "deleteSingleItemsRentals[Delete an Item]" \
            "deleteSingleItemsShipment[Delete an Item]" \
            "deleteSingleItemsSocialMedia[Delete an Item]" \
            "deleteSingleItemsSocialResponsibility[Delete an Item]" \
            "deleteSingleItemsSuppliers[Delete an Item]" \
            "deleteSingleItemsSurveys[Delete an Item]" \
            "deleteSingleItemsSustainableSupplyChain[Delete an Item]" \
            "deleteSingleItemsTaxes[Delete an Item]" \
            "deleteSingleItemsTraining[Delete an Item]" \
            "deleteSingleItemsTransactions[Delete an Item]" \
            "readItemsAccounts[List Items]" \
            "readItemsAppointments[List Items]" \
            "readItemsBudgets[List Items]" \
            "readItemsCampaigns[List Items]" \
            "readItemsCarbonFootprint[List Items]" \
            "readItemsCompanyAssets[List Items]" \
            "readItemsContent[List Items]" \
            "readItemsContracts[List Items]" \
            "readItemsCrm[List Items]" \
            "readItemsDepartment[List Items]" \
            "readItemsDistribution[List Items]" \
            "readItemsEmailCampaigns[List Items]" \
            "readItemsEmployeeDirectory[List Items]" \
            "readItemsEnergyEfficiency[List Items]" \
            "readItemsEnvironmentalCompliance[List Items]" \
            "readItemsEvents[List Items]" \
            "readItemsExpenses[List Items]" \
            "readItemsFacilities[List Items]" \
            "readItemsFeedback[List Items]" \
            "readItemsForum[List Items]" \
            "readItemsFulfillment[List Items]" \
            "readItemsGovernanceandEthics[List Items]" \
            "readItemsHelpdesk[List Items]" \
            "readItemsInventory[List Items]" \
            "readItemsInvoices[List Items]" \
            "readItemsInvoicing[List Items]" \
            "readItemsLifecycle[List Items]" \
            "readItemsLiveChat[List Items]" \
            "readItemsLoyalty[List Items]" \
            "readItemsMaintenance[List Items]" \
            "readItemsPayroll[List Items]" \
            "readItemsPerformance[List Items]" \
            "readItemsPointofSale[List Items]" \
            "readItemsPolicy[List Items]" \
            "readItemsProcurement[List Items]" \
            "readItemsProductionBatch[List Items]" \
            "readItemsProject[List Items]" \
            "readItemsPurchaseOrders[List Items]" \
            "readItemsQualityCheck[List Items]" \
            "readItemsQuotes[List Items]" \
            "readItemsRecruit[List Items]" \
            "readItemsRegulations[List Items]" \
            "readItemsRentals[List Items]" \
            "readItemsShipment[List Items]" \
            "readItemsSocialMedia[List Items]" \
            "readItemsSocialResponsibility[List Items]" \
            "readItemsSuppliers[List Items]" \
            "readItemsSurveys[List Items]" \
            "readItemsSustainableSupplyChain[List Items]" \
            "readItemsTaxes[List Items]" \
            "readItemsTraining[List Items]" \
            "readItemsTransactions[List Items]" \
            "readSingleItemsAccounts[Retrieve an Item]" \
            "readSingleItemsAppointments[Retrieve an Item]" \
            "readSingleItemsBudgets[Retrieve an Item]" \
            "readSingleItemsCampaigns[Retrieve an Item]" \
            "readSingleItemsCarbonFootprint[Retrieve an Item]" \
            "readSingleItemsCompanyAssets[Retrieve an Item]" \
            "readSingleItemsContent[Retrieve an Item]" \
            "readSingleItemsContracts[Retrieve an Item]" \
            "readSingleItemsCrm[Retrieve an Item]" \
            "readSingleItemsDepartment[Retrieve an Item]" \
            "readSingleItemsDistribution[Retrieve an Item]" \
            "readSingleItemsEmailCampaigns[Retrieve an Item]" \
            "readSingleItemsEmployeeDirectory[Retrieve an Item]" \
            "readSingleItemsEnergyEfficiency[Retrieve an Item]" \
            "readSingleItemsEnvironmentalCompliance[Retrieve an Item]" \
            "readSingleItemsEvents[Retrieve an Item]" \
            "readSingleItemsExpenses[Retrieve an Item]" \
            "readSingleItemsFacilities[Retrieve an Item]" \
            "readSingleItemsFeedback[Retrieve an Item]" \
            "readSingleItemsForum[Retrieve an Item]" \
            "readSingleItemsFulfillment[Retrieve an Item]" \
            "readSingleItemsGovernanceandEthics[Retrieve an Item]" \
            "readSingleItemsHelpdesk[Retrieve an Item]" \
            "readSingleItemsInventory[Retrieve an Item]" \
            "readSingleItemsInvoices[Retrieve an Item]" \
            "readSingleItemsInvoicing[Retrieve an Item]" \
            "readSingleItemsLifecycle[Retrieve an Item]" \
            "readSingleItemsLiveChat[Retrieve an Item]" \
            "readSingleItemsLoyalty[Retrieve an Item]" \
            "readSingleItemsMaintenance[Retrieve an Item]" \
            "readSingleItemsPayroll[Retrieve an Item]" \
            "readSingleItemsPerformance[Retrieve an Item]" \
            "readSingleItemsPointofSale[Retrieve an Item]" \
            "readSingleItemsPolicy[Retrieve an Item]" \
            "readSingleItemsProcurement[Retrieve an Item]" \
            "readSingleItemsProductionBatch[Retrieve an Item]" \
            "readSingleItemsProject[Retrieve an Item]" \
            "readSingleItemsPurchaseOrders[Retrieve an Item]" \
            "readSingleItemsQualityCheck[Retrieve an Item]" \
            "readSingleItemsQuotes[Retrieve an Item]" \
            "readSingleItemsRecruit[Retrieve an Item]" \
            "readSingleItemsRegulations[Retrieve an Item]" \
            "readSingleItemsRentals[Retrieve an Item]" \
            "readSingleItemsShipment[Retrieve an Item]" \
            "readSingleItemsSocialMedia[Retrieve an Item]" \
            "readSingleItemsSocialResponsibility[Retrieve an Item]" \
            "readSingleItemsSuppliers[Retrieve an Item]" \
            "readSingleItemsSurveys[Retrieve an Item]" \
            "readSingleItemsSustainableSupplyChain[Retrieve an Item]" \
            "readSingleItemsTaxes[Retrieve an Item]" \
            "readSingleItemsTraining[Retrieve an Item]" \
            "readSingleItemsTransactions[Retrieve an Item]" \
            "updateItemsAccounts[Update Multiple Items]" \
            "updateItemsAppointments[Update Multiple Items]" \
            "updateItemsBudgets[Update Multiple Items]" \
            "updateItemsCampaigns[Update Multiple Items]" \
            "updateItemsCarbonFootprint[Update Multiple Items]" \
            "updateItemsCompanyAssets[Update Multiple Items]" \
            "updateItemsContent[Update Multiple Items]" \
            "updateItemsContracts[Update Multiple Items]" \
            "updateItemsCrm[Update Multiple Items]" \
            "updateItemsDepartment[Update Multiple Items]" \
            "updateItemsDistribution[Update Multiple Items]" \
            "updateItemsEmailCampaigns[Update Multiple Items]" \
            "updateItemsEmployeeDirectory[Update Multiple Items]" \
            "updateItemsEnergyEfficiency[Update Multiple Items]" \
            "updateItemsEnvironmentalCompliance[Update Multiple Items]" \
            "updateItemsEvents[Update Multiple Items]" \
            "updateItemsExpenses[Update Multiple Items]" \
            "updateItemsFacilities[Update Multiple Items]" \
            "updateItemsFeedback[Update Multiple Items]" \
            "updateItemsForum[Update Multiple Items]" \
            "updateItemsFulfillment[Update Multiple Items]" \
            "updateItemsGovernanceandEthics[Update Multiple Items]" \
            "updateItemsHelpdesk[Update Multiple Items]" \
            "updateItemsInventory[Update Multiple Items]" \
            "updateItemsInvoices[Update Multiple Items]" \
            "updateItemsInvoicing[Update Multiple Items]" \
            "updateItemsLifecycle[Update Multiple Items]" \
            "updateItemsLiveChat[Update Multiple Items]" \
            "updateItemsLoyalty[Update Multiple Items]" \
            "updateItemsMaintenance[Update Multiple Items]" \
            "updateItemsPayroll[Update Multiple Items]" \
            "updateItemsPerformance[Update Multiple Items]" \
            "updateItemsPointofSale[Update Multiple Items]" \
            "updateItemsPolicy[Update Multiple Items]" \
            "updateItemsProcurement[Update Multiple Items]" \
            "updateItemsProductionBatch[Update Multiple Items]" \
            "updateItemsProject[Update Multiple Items]" \
            "updateItemsPurchaseOrders[Update Multiple Items]" \
            "updateItemsQualityCheck[Update Multiple Items]" \
            "updateItemsQuotes[Update Multiple Items]" \
            "updateItemsRecruit[Update Multiple Items]" \
            "updateItemsRegulations[Update Multiple Items]" \
            "updateItemsRentals[Update Multiple Items]" \
            "updateItemsShipment[Update Multiple Items]" \
            "updateItemsSocialMedia[Update Multiple Items]" \
            "updateItemsSocialResponsibility[Update Multiple Items]" \
            "updateItemsSuppliers[Update Multiple Items]" \
            "updateItemsSurveys[Update Multiple Items]" \
            "updateItemsSustainableSupplyChain[Update Multiple Items]" \
            "updateItemsTaxes[Update Multiple Items]" \
            "updateItemsTraining[Update Multiple Items]" \
            "updateItemsTransactions[Update Multiple Items]" \
            "updateSingleItemsAccounts[Update an Item]" \
            "updateSingleItemsAppointments[Update an Item]" \
            "updateSingleItemsBudgets[Update an Item]" \
            "updateSingleItemsCampaigns[Update an Item]" \
            "updateSingleItemsCarbonFootprint[Update an Item]" \
            "updateSingleItemsCompanyAssets[Update an Item]" \
            "updateSingleItemsContent[Update an Item]" \
            "updateSingleItemsContracts[Update an Item]" \
            "updateSingleItemsCrm[Update an Item]" \
            "updateSingleItemsDepartment[Update an Item]" \
            "updateSingleItemsDistribution[Update an Item]" \
            "updateSingleItemsEmailCampaigns[Update an Item]" \
            "updateSingleItemsEmployeeDirectory[Update an Item]" \
            "updateSingleItemsEnergyEfficiency[Update an Item]" \
            "updateSingleItemsEnvironmentalCompliance[Update an Item]" \
            "updateSingleItemsEvents[Update an Item]" \
            "updateSingleItemsExpenses[Update an Item]" \
            "updateSingleItemsFacilities[Update an Item]" \
            "updateSingleItemsFeedback[Update an Item]" \
            "updateSingleItemsForum[Update an Item]" \
            "updateSingleItemsFulfillment[Update an Item]" \
            "updateSingleItemsGovernanceandEthics[Update an Item]" \
            "updateSingleItemsHelpdesk[Update an Item]" \
            "updateSingleItemsInventory[Update an Item]" \
            "updateSingleItemsInvoices[Update an Item]" \
            "updateSingleItemsInvoicing[Update an Item]" \
            "updateSingleItemsLifecycle[Update an Item]" \
            "updateSingleItemsLiveChat[Update an Item]" \
            "updateSingleItemsLoyalty[Update an Item]" \
            "updateSingleItemsMaintenance[Update an Item]" \
            "updateSingleItemsPayroll[Update an Item]" \
            "updateSingleItemsPerformance[Update an Item]" \
            "updateSingleItemsPointofSale[Update an Item]" \
            "updateSingleItemsPolicy[Update an Item]" \
            "updateSingleItemsProcurement[Update an Item]" \
            "updateSingleItemsProductionBatch[Update an Item]" \
            "updateSingleItemsProject[Update an Item]" \
            "updateSingleItemsPurchaseOrders[Update an Item]" \
            "updateSingleItemsQualityCheck[Update an Item]" \
            "updateSingleItemsQuotes[Update an Item]" \
            "updateSingleItemsRecruit[Update an Item]" \
            "updateSingleItemsRegulations[Update an Item]" \
            "updateSingleItemsRentals[Update an Item]" \
            "updateSingleItemsShipment[Update an Item]" \
            "updateSingleItemsSocialMedia[Update an Item]" \
            "updateSingleItemsSocialResponsibility[Update an Item]" \
            "updateSingleItemsSuppliers[Update an Item]" \
            "updateSingleItemsSurveys[Update an Item]" \
            "updateSingleItemsSustainableSupplyChain[Update an Item]" \
            "updateSingleItemsTaxes[Update an Item]" \
            "updateSingleItemsTraining[Update an Item]" \
            "updateSingleItemsTransactions[Update an Item]"             "createItemsAccounts[Create an Item]" \
            "deleteItemsAccounts[Delete Multiple Items]" \
            "deleteSingleItemsAccounts[Delete an Item]" \
            "readItemsAccounts[List Items]" \
            "readSingleItemsAccounts[Retrieve an Item]" \
            "updateItemsAccounts[Update Multiple Items]" \
            "updateSingleItemsAccounts[Update an Item]"             "createItemsAppointments[Create an Item]" \
            "deleteItemsAppointments[Delete Multiple Items]" \
            "deleteSingleItemsAppointments[Delete an Item]" \
            "readItemsAppointments[List Items]" \
            "readSingleItemsAppointments[Retrieve an Item]" \
            "updateItemsAppointments[Update Multiple Items]" \
            "updateSingleItemsAppointments[Update an Item]"             "createItemsBudgets[Create an Item]" \
            "deleteItemsBudgets[Delete Multiple Items]" \
            "deleteSingleItemsBudgets[Delete an Item]" \
            "readItemsBudgets[List Items]" \
            "readSingleItemsBudgets[Retrieve an Item]" \
            "updateItemsBudgets[Update Multiple Items]" \
            "updateSingleItemsBudgets[Update an Item]"             "createItemsCampaigns[Create an Item]" \
            "deleteItemsCampaigns[Delete Multiple Items]" \
            "deleteSingleItemsCampaigns[Delete an Item]" \
            "readItemsCampaigns[List Items]" \
            "readSingleItemsCampaigns[Retrieve an Item]" \
            "updateItemsCampaigns[Update Multiple Items]" \
            "updateSingleItemsCampaigns[Update an Item]"             "createItemsCarbonFootprint[Create an Item]" \
            "deleteItemsCarbonFootprint[Delete Multiple Items]" \
            "deleteSingleItemsCarbonFootprint[Delete an Item]" \
            "readItemsCarbonFootprint[List Items]" \
            "readSingleItemsCarbonFootprint[Retrieve an Item]" \
            "updateItemsCarbonFootprint[Update Multiple Items]" \
            "updateSingleItemsCarbonFootprint[Update an Item]"             "createItemsCompanyAssets[Create an Item]" \
            "deleteItemsCompanyAssets[Delete Multiple Items]" \
            "deleteSingleItemsCompanyAssets[Delete an Item]" \
            "readItemsCompanyAssets[List Items]" \
            "readSingleItemsCompanyAssets[Retrieve an Item]" \
            "updateItemsCompanyAssets[Update Multiple Items]" \
            "updateSingleItemsCompanyAssets[Update an Item]"             "createItemsContent[Create an Item]" \
            "deleteItemsContent[Delete Multiple Items]" \
            "deleteSingleItemsContent[Delete an Item]" \
            "readItemsContent[List Items]" \
            "readSingleItemsContent[Retrieve an Item]" \
            "updateItemsContent[Update Multiple Items]" \
            "updateSingleItemsContent[Update an Item]"             "createItemsContracts[Create an Item]" \
            "deleteItemsContracts[Delete Multiple Items]" \
            "deleteSingleItemsContracts[Delete an Item]" \
            "readItemsContracts[List Items]" \
            "readSingleItemsContracts[Retrieve an Item]" \
            "updateItemsContracts[Update Multiple Items]" \
            "updateSingleItemsContracts[Update an Item]"             "createItemsCrm[Create an Item]" \
            "deleteItemsCrm[Delete Multiple Items]" \
            "deleteSingleItemsCrm[Delete an Item]" \
            "readItemsCrm[List Items]" \
            "readSingleItemsCrm[Retrieve an Item]" \
            "updateItemsCrm[Update Multiple Items]" \
            "updateSingleItemsCrm[Update an Item]"             "createItemsDepartment[Create an Item]" \
            "deleteItemsDepartment[Delete Multiple Items]" \
            "deleteSingleItemsDepartment[Delete an Item]" \
            "readItemsDepartment[List Items]" \
            "readSingleItemsDepartment[Retrieve an Item]" \
            "updateItemsDepartment[Update Multiple Items]" \
            "updateSingleItemsDepartment[Update an Item]"             "createItemsDistribution[Create an Item]" \
            "deleteItemsDistribution[Delete Multiple Items]" \
            "deleteSingleItemsDistribution[Delete an Item]" \
            "readItemsDistribution[List Items]" \
            "readSingleItemsDistribution[Retrieve an Item]" \
            "updateItemsDistribution[Update Multiple Items]" \
            "updateSingleItemsDistribution[Update an Item]"             "createItemsEmailCampaigns[Create an Item]" \
            "deleteItemsEmailCampaigns[Delete Multiple Items]" \
            "deleteSingleItemsEmailCampaigns[Delete an Item]" \
            "readItemsEmailCampaigns[List Items]" \
            "readSingleItemsEmailCampaigns[Retrieve an Item]" \
            "updateItemsEmailCampaigns[Update Multiple Items]" \
            "updateSingleItemsEmailCampaigns[Update an Item]"             "createItemsEmployeeDirectory[Create an Item]" \
            "deleteItemsEmployeeDirectory[Delete Multiple Items]" \
            "deleteSingleItemsEmployeeDirectory[Delete an Item]" \
            "readItemsEmployeeDirectory[List Items]" \
            "readSingleItemsEmployeeDirectory[Retrieve an Item]" \
            "updateItemsEmployeeDirectory[Update Multiple Items]" \
            "updateSingleItemsEmployeeDirectory[Update an Item]"             "createItemsEnergyEfficiency[Create an Item]" \
            "deleteItemsEnergyEfficiency[Delete Multiple Items]" \
            "deleteSingleItemsEnergyEfficiency[Delete an Item]" \
            "readItemsEnergyEfficiency[List Items]" \
            "readSingleItemsEnergyEfficiency[Retrieve an Item]" \
            "updateItemsEnergyEfficiency[Update Multiple Items]" \
            "updateSingleItemsEnergyEfficiency[Update an Item]"             "createItemsEnvironmentalCompliance[Create an Item]" \
            "deleteItemsEnvironmentalCompliance[Delete Multiple Items]" \
            "deleteSingleItemsEnvironmentalCompliance[Delete an Item]" \
            "readItemsEnvironmentalCompliance[List Items]" \
            "readSingleItemsEnvironmentalCompliance[Retrieve an Item]" \
            "updateItemsEnvironmentalCompliance[Update Multiple Items]" \
            "updateSingleItemsEnvironmentalCompliance[Update an Item]"             "createItemsEvents[Create an Item]" \
            "deleteItemsEvents[Delete Multiple Items]" \
            "deleteSingleItemsEvents[Delete an Item]" \
            "readItemsEvents[List Items]" \
            "readSingleItemsEvents[Retrieve an Item]" \
            "updateItemsEvents[Update Multiple Items]" \
            "updateSingleItemsEvents[Update an Item]"             "createItemsExpenses[Create an Item]" \
            "deleteItemsExpenses[Delete Multiple Items]" \
            "deleteSingleItemsExpenses[Delete an Item]" \
            "readItemsExpenses[List Items]" \
            "readSingleItemsExpenses[Retrieve an Item]" \
            "updateItemsExpenses[Update Multiple Items]" \
            "updateSingleItemsExpenses[Update an Item]"             "createItemsFacilities[Create an Item]" \
            "deleteItemsFacilities[Delete Multiple Items]" \
            "deleteSingleItemsFacilities[Delete an Item]" \
            "readItemsFacilities[List Items]" \
            "readSingleItemsFacilities[Retrieve an Item]" \
            "updateItemsFacilities[Update Multiple Items]" \
            "updateSingleItemsFacilities[Update an Item]"             "createItemsFeedback[Create an Item]" \
            "deleteItemsFeedback[Delete Multiple Items]" \
            "deleteSingleItemsFeedback[Delete an Item]" \
            "readItemsFeedback[List Items]" \
            "readSingleItemsFeedback[Retrieve an Item]" \
            "updateItemsFeedback[Update Multiple Items]" \
            "updateSingleItemsFeedback[Update an Item]"             "createItemsForum[Create an Item]" \
            "deleteItemsForum[Delete Multiple Items]" \
            "deleteSingleItemsForum[Delete an Item]" \
            "readItemsForum[List Items]" \
            "readSingleItemsForum[Retrieve an Item]" \
            "updateItemsForum[Update Multiple Items]" \
            "updateSingleItemsForum[Update an Item]"             "createItemsFulfillment[Create an Item]" \
            "deleteItemsFulfillment[Delete Multiple Items]" \
            "deleteSingleItemsFulfillment[Delete an Item]" \
            "readItemsFulfillment[List Items]" \
            "readSingleItemsFulfillment[Retrieve an Item]" \
            "updateItemsFulfillment[Update Multiple Items]" \
            "updateSingleItemsFulfillment[Update an Item]"             "createItemsGovernanceandEthics[Create an Item]" \
            "deleteItemsGovernanceandEthics[Delete Multiple Items]" \
            "deleteSingleItemsGovernanceandEthics[Delete an Item]" \
            "readItemsGovernanceandEthics[List Items]" \
            "readSingleItemsGovernanceandEthics[Retrieve an Item]" \
            "updateItemsGovernanceandEthics[Update Multiple Items]" \
            "updateSingleItemsGovernanceandEthics[Update an Item]"             "createItemsHelpdesk[Create an Item]" \
            "deleteItemsHelpdesk[Delete Multiple Items]" \
            "deleteSingleItemsHelpdesk[Delete an Item]" \
            "readItemsHelpdesk[List Items]" \
            "readSingleItemsHelpdesk[Retrieve an Item]" \
            "updateItemsHelpdesk[Update Multiple Items]" \
            "updateSingleItemsHelpdesk[Update an Item]"             "createItemsInventory[Create an Item]" \
            "deleteItemsInventory[Delete Multiple Items]" \
            "deleteSingleItemsInventory[Delete an Item]" \
            "readItemsInventory[List Items]" \
            "readSingleItemsInventory[Retrieve an Item]" \
            "updateItemsInventory[Update Multiple Items]" \
            "updateSingleItemsInventory[Update an Item]"             "createItemsInvoices[Create an Item]" \
            "deleteItemsInvoices[Delete Multiple Items]" \
            "deleteSingleItemsInvoices[Delete an Item]" \
            "readItemsInvoices[List Items]" \
            "readSingleItemsInvoices[Retrieve an Item]" \
            "updateItemsInvoices[Update Multiple Items]" \
            "updateSingleItemsInvoices[Update an Item]"             "createItemsInvoicing[Create an Item]" \
            "deleteItemsInvoicing[Delete Multiple Items]" \
            "deleteSingleItemsInvoicing[Delete an Item]" \
            "readItemsInvoicing[List Items]" \
            "readSingleItemsInvoicing[Retrieve an Item]" \
            "updateItemsInvoicing[Update Multiple Items]" \
            "updateSingleItemsInvoicing[Update an Item]"             "createItemsLifecycle[Create an Item]" \
            "deleteItemsLifecycle[Delete Multiple Items]" \
            "deleteSingleItemsLifecycle[Delete an Item]" \
            "readItemsLifecycle[List Items]" \
            "readSingleItemsLifecycle[Retrieve an Item]" \
            "updateItemsLifecycle[Update Multiple Items]" \
            "updateSingleItemsLifecycle[Update an Item]"             "createItemsLiveChat[Create an Item]" \
            "deleteItemsLiveChat[Delete Multiple Items]" \
            "deleteSingleItemsLiveChat[Delete an Item]" \
            "readItemsLiveChat[List Items]" \
            "readSingleItemsLiveChat[Retrieve an Item]" \
            "updateItemsLiveChat[Update Multiple Items]" \
            "updateSingleItemsLiveChat[Update an Item]"             "createItemsLoyalty[Create an Item]" \
            "deleteItemsLoyalty[Delete Multiple Items]" \
            "deleteSingleItemsLoyalty[Delete an Item]" \
            "readItemsLoyalty[List Items]" \
            "readSingleItemsLoyalty[Retrieve an Item]" \
            "updateItemsLoyalty[Update Multiple Items]" \
            "updateSingleItemsLoyalty[Update an Item]"             "createItemsMaintenance[Create an Item]" \
            "deleteItemsMaintenance[Delete Multiple Items]" \
            "deleteSingleItemsMaintenance[Delete an Item]" \
            "readItemsMaintenance[List Items]" \
            "readSingleItemsMaintenance[Retrieve an Item]" \
            "updateItemsMaintenance[Update Multiple Items]" \
            "updateSingleItemsMaintenance[Update an Item]"             "createItemsPayroll[Create an Item]" \
            "deleteItemsPayroll[Delete Multiple Items]" \
            "deleteSingleItemsPayroll[Delete an Item]" \
            "readItemsPayroll[List Items]" \
            "readSingleItemsPayroll[Retrieve an Item]" \
            "updateItemsPayroll[Update Multiple Items]" \
            "updateSingleItemsPayroll[Update an Item]"             "createItemsPerformance[Create an Item]" \
            "deleteItemsPerformance[Delete Multiple Items]" \
            "deleteSingleItemsPerformance[Delete an Item]" \
            "readItemsPerformance[List Items]" \
            "readSingleItemsPerformance[Retrieve an Item]" \
            "updateItemsPerformance[Update Multiple Items]" \
            "updateSingleItemsPerformance[Update an Item]"             "createItemsPointofSale[Create an Item]" \
            "deleteItemsPointofSale[Delete Multiple Items]" \
            "deleteSingleItemsPointofSale[Delete an Item]" \
            "readItemsPointofSale[List Items]" \
            "readSingleItemsPointofSale[Retrieve an Item]" \
            "updateItemsPointofSale[Update Multiple Items]" \
            "updateSingleItemsPointofSale[Update an Item]"             "createItemsPolicy[Create an Item]" \
            "deleteItemsPolicy[Delete Multiple Items]" \
            "deleteSingleItemsPolicy[Delete an Item]" \
            "readItemsPolicy[List Items]" \
            "readSingleItemsPolicy[Retrieve an Item]" \
            "updateItemsPolicy[Update Multiple Items]" \
            "updateSingleItemsPolicy[Update an Item]"             "createItemsProcurement[Create an Item]" \
            "deleteItemsProcurement[Delete Multiple Items]" \
            "deleteSingleItemsProcurement[Delete an Item]" \
            "readItemsProcurement[List Items]" \
            "readSingleItemsProcurement[Retrieve an Item]" \
            "updateItemsProcurement[Update Multiple Items]" \
            "updateSingleItemsProcurement[Update an Item]"             "createItemsProductionBatch[Create an Item]" \
            "deleteItemsProductionBatch[Delete Multiple Items]" \
            "deleteSingleItemsProductionBatch[Delete an Item]" \
            "readItemsProductionBatch[List Items]" \
            "readSingleItemsProductionBatch[Retrieve an Item]" \
            "updateItemsProductionBatch[Update Multiple Items]" \
            "updateSingleItemsProductionBatch[Update an Item]"             "createItemsProject[Create an Item]" \
            "deleteItemsProject[Delete Multiple Items]" \
            "deleteSingleItemsProject[Delete an Item]" \
            "readItemsProject[List Items]" \
            "readSingleItemsProject[Retrieve an Item]" \
            "updateItemsProject[Update Multiple Items]" \
            "updateSingleItemsProject[Update an Item]"             "createItemsPurchaseOrders[Create an Item]" \
            "deleteItemsPurchaseOrders[Delete Multiple Items]" \
            "deleteSingleItemsPurchaseOrders[Delete an Item]" \
            "readItemsPurchaseOrders[List Items]" \
            "readSingleItemsPurchaseOrders[Retrieve an Item]" \
            "updateItemsPurchaseOrders[Update Multiple Items]" \
            "updateSingleItemsPurchaseOrders[Update an Item]"             "createItemsQualityCheck[Create an Item]" \
            "deleteItemsQualityCheck[Delete Multiple Items]" \
            "deleteSingleItemsQualityCheck[Delete an Item]" \
            "readItemsQualityCheck[List Items]" \
            "readSingleItemsQualityCheck[Retrieve an Item]" \
            "updateItemsQualityCheck[Update Multiple Items]" \
            "updateSingleItemsQualityCheck[Update an Item]"             "createItemsQuotes[Create an Item]" \
            "deleteItemsQuotes[Delete Multiple Items]" \
            "deleteSingleItemsQuotes[Delete an Item]" \
            "readItemsQuotes[List Items]" \
            "readSingleItemsQuotes[Retrieve an Item]" \
            "updateItemsQuotes[Update Multiple Items]" \
            "updateSingleItemsQuotes[Update an Item]"             "createItemsRecruit[Create an Item]" \
            "deleteItemsRecruit[Delete Multiple Items]" \
            "deleteSingleItemsRecruit[Delete an Item]" \
            "readItemsRecruit[List Items]" \
            "readSingleItemsRecruit[Retrieve an Item]" \
            "updateItemsRecruit[Update Multiple Items]" \
            "updateSingleItemsRecruit[Update an Item]"             "createItemsRegulations[Create an Item]" \
            "deleteItemsRegulations[Delete Multiple Items]" \
            "deleteSingleItemsRegulations[Delete an Item]" \
            "readItemsRegulations[List Items]" \
            "readSingleItemsRegulations[Retrieve an Item]" \
            "updateItemsRegulations[Update Multiple Items]" \
            "updateSingleItemsRegulations[Update an Item]"             "createItemsRentals[Create an Item]" \
            "deleteItemsRentals[Delete Multiple Items]" \
            "deleteSingleItemsRentals[Delete an Item]" \
            "readItemsRentals[List Items]" \
            "readSingleItemsRentals[Retrieve an Item]" \
            "updateItemsRentals[Update Multiple Items]" \
            "updateSingleItemsRentals[Update an Item]"             "createItemsShipment[Create an Item]" \
            "deleteItemsShipment[Delete Multiple Items]" \
            "deleteSingleItemsShipment[Delete an Item]" \
            "readItemsShipment[List Items]" \
            "readSingleItemsShipment[Retrieve an Item]" \
            "updateItemsShipment[Update Multiple Items]" \
            "updateSingleItemsShipment[Update an Item]"             "createItemsSocialMedia[Create an Item]" \
            "deleteItemsSocialMedia[Delete Multiple Items]" \
            "deleteSingleItemsSocialMedia[Delete an Item]" \
            "readItemsSocialMedia[List Items]" \
            "readSingleItemsSocialMedia[Retrieve an Item]" \
            "updateItemsSocialMedia[Update Multiple Items]" \
            "updateSingleItemsSocialMedia[Update an Item]"             "createItemsSocialResponsibility[Create an Item]" \
            "deleteItemsSocialResponsibility[Delete Multiple Items]" \
            "deleteSingleItemsSocialResponsibility[Delete an Item]" \
            "readItemsSocialResponsibility[List Items]" \
            "readSingleItemsSocialResponsibility[Retrieve an Item]" \
            "updateItemsSocialResponsibility[Update Multiple Items]" \
            "updateSingleItemsSocialResponsibility[Update an Item]"             "createItemsSuppliers[Create an Item]" \
            "deleteItemsSuppliers[Delete Multiple Items]" \
            "deleteSingleItemsSuppliers[Delete an Item]" \
            "readItemsSuppliers[List Items]" \
            "readSingleItemsSuppliers[Retrieve an Item]" \
            "updateItemsSuppliers[Update Multiple Items]" \
            "updateSingleItemsSuppliers[Update an Item]"             "createItemsSurveys[Create an Item]" \
            "deleteItemsSurveys[Delete Multiple Items]" \
            "deleteSingleItemsSurveys[Delete an Item]" \
            "readItemsSurveys[List Items]" \
            "readSingleItemsSurveys[Retrieve an Item]" \
            "updateItemsSurveys[Update Multiple Items]" \
            "updateSingleItemsSurveys[Update an Item]"             "createItemsSustainableSupplyChain[Create an Item]" \
            "deleteItemsSustainableSupplyChain[Delete Multiple Items]" \
            "deleteSingleItemsSustainableSupplyChain[Delete an Item]" \
            "readItemsSustainableSupplyChain[List Items]" \
            "readSingleItemsSustainableSupplyChain[Retrieve an Item]" \
            "updateItemsSustainableSupplyChain[Update Multiple Items]" \
            "updateSingleItemsSustainableSupplyChain[Update an Item]"             "createItemsTaxes[Create an Item]" \
            "deleteItemsTaxes[Delete Multiple Items]" \
            "deleteSingleItemsTaxes[Delete an Item]" \
            "readItemsTaxes[List Items]" \
            "readSingleItemsTaxes[Retrieve an Item]" \
            "updateItemsTaxes[Update Multiple Items]" \
            "updateSingleItemsTaxes[Update an Item]"             "createItemsTraining[Create an Item]" \
            "deleteItemsTraining[Delete Multiple Items]" \
            "deleteSingleItemsTraining[Delete an Item]" \
            "readItemsTraining[List Items]" \
            "readSingleItemsTraining[Retrieve an Item]" \
            "updateItemsTraining[Update Multiple Items]" \
            "updateSingleItemsTraining[Update an Item]"             "createItemsTransactions[Create an Item]" \
            "deleteItemsTransactions[Delete Multiple Items]" \
            "deleteSingleItemsTransactions[Delete an Item]" \
            "readItemsTransactions[List Items]" \
            "readSingleItemsTransactions[Retrieve an Item]" \
            "updateItemsTransactions[Update Multiple Items]" \
            "updateSingleItemsTransactions[Update an Item]"             "getMyPermissions[List My Permissions]" \
            "getPermission[Retrieve a Permission]" \
            "getPermissions[List Permissions]"             "createPreset[Create a Preset]" \
            "deletePreset[Delete a Preset]" \
            "deletePresets[Delete Multiple Presets]" \
            "getPreset[Retrieve a Preset]" \
            "getPresets[List Presets]" \
            "updatePreset[Update a Preset]" \
            "updatePresets[Update Multiple Presets]"             "getRelation[Retrieve a Relation]" \
            "getRelations[List Relations]"             "getRole[Retrieve a Role]" \
            "getRoles[List Roles]"             "schemaApply[Apply Schema Difference]" \
            "schemaDiff[Retrieve Schema Difference]" \
            "schemaSnapshot[Retrieve Schema Snapshot]"             "ping[Ping]" \
            "serverInfo[System Info]"             "getSettings[Retrieve Settings]"             "getMe[Retrieve Current User]" \
            "getUser[Retrieve a User]" \
            "getUsers[List Users]" \
            "updateLastUsedPageMe[Update Last Page]" \
            "updateMe[Update Current User]" \
            "updateUser[Update a User]" \
            "updateUsers[Update Multiple Users]"             "clearCache[Clear Cache]" \
            "export[Export Items]" \
            "hashGenerate[Hash a string]" \
            "hashVerify[Hash a string]" \
            "import[Import Items]" \
            "random[Get a Random String]" \
            "sort[Sort Items]" \

    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      createComment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivities)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivity)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAsset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the file."
          "key=:[QUERY] The key of the asset size configured in settings."
"transforms=:[QUERY] A JSON array of image transformations"
"download=true:[QUERY] Download the asset to your computer"
          "download=false:[QUERY] Download the asset to your computer"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      login)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      logout)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      oauth)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      oauthProvider)
        local -a _op_arguments
        _op_arguments=(
          "provider=:[PATH] Key of the activated OAuth provider."
          "redirect=:[QUERY] Where to redirect on successful login.&lt;br/&gt;If set the authentication details are set inside cookies otherwise a JSON is returned."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      passwordRequest)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      passwordReset)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      refresh)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCollection)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier of the collection."
          "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCollections)
        local -a _op_arguments
        _op_arguments=(
                    "offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDisplays)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInterfaces)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLayouts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getModules)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCollectionField)
        local -a _op_arguments
        _op_arguments=(
          "collection=:[PATH] Unique identifier of the collection the item resides in."
"id=:[PATH] Unique identifier of the field."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCollectionFields)
        local -a _op_arguments
        _op_arguments=(
          "collection=:[PATH] Unique identifier of the collection the item resides in."
          "sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFields)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] A limit on the number of objects that are returned."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createFile)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFile)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFiles)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFile)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFiles)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateFile)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateFiles)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFlow)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFlows)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createFolder)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFolder)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFolders)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFolder)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFolders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateFolder)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateFolders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsContent)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsForum)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProject)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsAccounts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsAppointments)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsBudgets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCarbonFootprint)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCompanyAssets)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsContent)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsContent)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsContracts)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsContracts)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsCrm)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsCrm)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsDepartment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsDistribution)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEmailCampaigns)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEmployeeDirectory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEnergyEfficiency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEnvironmentalCompliance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsEvents)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsEvents)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsExpenses)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFacilities)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFeedback)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsForum)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsForum)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsForum)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsFulfillment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsGovernanceandEthics)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsHelpdesk)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInventory)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInvoices)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsInvoicing)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLifecycle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLiveChat)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsLoyalty)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsMaintenance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPayroll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPerformance)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPointofSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPolicy)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProcurement)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProductionBatch)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsProject)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsProject)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsProject)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsPurchaseOrders)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsQualityCheck)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsQuotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRecruit)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRegulations)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsRentals)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsRentals)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsShipment)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsShipment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSocialMedia)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSocialResponsibility)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSuppliers)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSurveys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsSustainableSupplyChain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTaxes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTraining)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTraining)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
"version=:[QUERY] Retrieve an item&#39;s state from a specific Content Version. The value corresponds to the \&quot;key\&quot; of the Content Version."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSingleItemsTransactions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index of the item."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMyPermissions)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPermission)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPermissions)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"page=:[QUERY] Cursor for use in pagination. Often used in combination with limit."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPreset)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePreset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePresets)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPreset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPresets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"page=:[QUERY] Cursor for use in pagination. Often used in combination with limit."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePreset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePresets)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRelation)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Index"
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRelations)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"page=:[QUERY] Cursor for use in pagination. Often used in combination with limit."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRole)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRoles)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
"page=:[QUERY] Cursor for use in pagination. Often used in combination with limit."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      schemaApply)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      schemaDiff)
        local -a _op_arguments
        _op_arguments=(
                    "force=true:[QUERY] Bypass version and database vendor restrictions."
          "force=false:[QUERY] Bypass version and database vendor restrictions."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      schemaSnapshot)
        local -a _op_arguments
        _op_arguments=(
                    "export=:[QUERY] Saves the API response to a file. Accepts one of \&quot;csv\&quot;, \&quot;json\&quot;, \&quot;xml\&quot;, \&quot;yaml\&quot;."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      ping)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      serverInfo)
        local -a _op_arguments
        _op_arguments=(
                    "super_admin_token=:[QUERY] The first time you create a project, the provided token will be saved and required for subsequent project installs. It can also be found and configured in &#39;/config/__api.json&#39; on your server."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSettings)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
"page=:[QUERY] Cursor for use in pagination. Often used in combination with limit."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMe)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"offset=:[QUERY] How many items to skip when fetching data."
"meta=:[QUERY] What metadata to return in the response."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateLastUsedPageMe)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateMe)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Unique identifier for the object."
          "fields=:[QUERY] Control what fields are being returned in the object."
"meta=:[QUERY] What metadata to return in the response."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUsers)
        local -a _op_arguments
        _op_arguments=(
                    "fields=:[QUERY] Control what fields are being returned in the object."
"limit=:[QUERY] A limit on the number of objects that are returned."
"meta=:[QUERY] What metadata to return in the response."
"offset=:[QUERY] How many items to skip when fetching data."
"sort=:[QUERY] How to sort the returned items. &#39;sort&#39; is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (&#39; - &#39;) can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a &#39; ? &#39; to sort randomly."
"filter=:[QUERY] Select items in collection by given conditions."
"search=:[QUERY] Filter by items that contain the given search query in one of their fields."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      clearCache)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      export)
        local -a _op_arguments
        _op_arguments=(
          "collection=:[PATH] Collection identifier"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      hashGenerate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      hashVerify)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      import)
        local -a _op_arguments
        _op_arguments=(
          "collection=:[PATH] Collection identifier"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      random)
        local -a _op_arguments
        _op_arguments=(
                    "length=:[QUERY] Length of the random string."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sort)
        local -a _op_arguments
        _op_arguments=(
          "collection=:[PATH] Collection identifier"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
