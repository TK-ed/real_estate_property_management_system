public with sharing class GetAuthenticated {
    public String authenticate() {
        String token = ApiEndpoints.getJwtTokens();
        return token;
    }
}