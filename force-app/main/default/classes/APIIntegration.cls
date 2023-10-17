public class APIIntegration {
    public static void synchronizeContactStatus(List<Map<String, Object>> contactData) {
        // Convertir les données en JSON
        String jsonData = JSON.serialize(contactData);

        // Appeler l'API
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://fxyozmgb2xs5iogcheotxi6hoa0jdhiz.lambda-url.eu-central-1.on.aws');
        request.setMethod('PATCH');
        request.setHeader('Authorization', 'salesforceAuthToken');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonData);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            // La synchronisation a réussi
        } else {
            // Gérer les erreurs en fonction du code de statut de réponse
        }
    }
}
