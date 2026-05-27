public with sharing class ApiEndpoints {
    private static final String AUTH_URL = 'https://mcczctzy1jxq4nzsrzlh1rk317z4.auth.marketingcloudapis.com/v2/token';
    private static final String BASE_URL = 'https://mcczctzy1jxq4nzsrzlh1rk317z4.rest.marketingcloudapis.com/';
    private static final String CLIENT_ID = 'pyx84cqt4i1an3t8czzqerg8';
    private static final String CLIENT_SECRET = 'fl9WDQnxeBAsaIaH0UQhmA0F';

    public static List<String> getApiKeys() {
        List<String> urls = new List<String>();
        urls.add(AUTH_URL);
        urls.add(BASE_URL);
        urls.add(CLIENT_ID);
        urls.add(CLIENT_SECRET);
        
        return urls;
    }

    public static String getJwtTokens() {
        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(AUTH_URL);
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // Set the body as a JSON object
            String body = 'grant_type=client_credentials&client_id=' + CLIENT_ID + '&client_secret=' + CLIENT_SECRET;
            request.setBody(body);
            HttpResponse response = http.send(request);
            if(response.getStatusCode() != 200) {
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            }
            Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String token = (String) jsonResponse.get('access_token'); // Correctly retrieve the access token
            return token;
        } catch (Exception e) {
            System.debug(e.getMessage());
            return '0';
        }
    }

    public static Map<String, String> getEndpoints()  {
        Map<String, String> endpoints = new Map<String, String>();
        
        endpoints.put('getDataExtensions', BASE_URL + 'data/v1/customobjects');
        endpoints.put('createDataExtension', BASE_URL + 'data/v1/customobjects');
        
        return endpoints;
    }
}