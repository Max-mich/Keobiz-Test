public class ContactSyncAPI {
    public static void syncContactStatus(List<Contact> contacts) {
        List<Map<String, Object>> contactUpdates = new List<Map<String, Object>>();

        for (Contact contact : contacts) {
            contactUpdates.add(new Map<String, Object>{
                'id' => contact.Id,
                'is_active' => contact.IsActive__c
            });
        }

        String requestBody = JSON.serialize(contactUpdates);

        // Appelez l'API de synchronisation en masse avec le requestBody
        // Gérez les réponses et les erreurs de l'API conformément à votre configuration.

        // Exemple d'appel d'API (à adapter à votre configuration) :
        // Http http = new Http();
        // HttpRequest request = new HttpRequest();
        // request.setEndpoint('https://fxyozmgb2xs5iogcheotxi6hoa0jdhiz.lambda-url.eu-central-1.on.aws');
        // request.setMethod('PATCH');
        // request.setBody(requestBody);
        // request.setHeader('Authorization', 'salesforceAuthToken');
        // HttpResponse response = http.send(request);
        // // Gérer la réponse HTTP ici
    }
}
