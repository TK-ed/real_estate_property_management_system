public with sharing class AnimalLocator {
    public static void getAnimalNameById(Integer id) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            //List<Object> animal = (List<Object>) results.get('animals');
            //List<Object> name = (List<Object>) results.get('name');
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
			String name = (String) animal.get('name');
			system.debug(results);
        }
        // return null;
    }
}