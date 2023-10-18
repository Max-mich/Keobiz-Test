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

         // Définir l'URL de l'API
         String apiUrl = System.getenv('API_URL');
         String authToken = System.getenv('API_TOKEN'); // Remplacez par votre jeton d'authentification
 
         // Créer une instance de la classe Http
         Http http = new Http();
         HttpRequest request = new HttpRequest();
 
         // Définir la méthode HTTP et l'URL
         request.setEndpoint(apiUrl);
         request.setMethod('PATCH');
 
         // Définir le corps de la requête
         request.setHeader('Content-Type', 'application/json');
         request.setHeader('Authorization', authToken);
         request.setBody(requestBody);
 
         // Envoyer la requête HTTP
         HttpResponse response = http.send(request);
 
         // Gérer la réponse HTTP
         if (response.getStatusCode() == 200) {
             System.debug('La synchronisation des contacts a réussi.');
             System.debug('Réponse de API : ' + response.getBody());
         } else {
             System.debug('La synchronisation des contacts a échoué.');
             System.debug('Code de statut HTTP : ' + response.getStatusCode());
             System.debug('Message erreur : ' + response.getStatus());
         }
 
        return response; // Vous pouvez retourner la réponse HTTP pour un traitement ultérieur si nécessaire.
    }
}
