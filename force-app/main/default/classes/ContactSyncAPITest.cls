@isTest
public class ContactSyncAPITest {
    @isTest
    static void testSyncContactStatus() {
        // Créez un contact fictif pour le test
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            IsActive__c = true
        );
        insert testContact;

        // Appelez la méthode de synchronisation en utilisant une liste de contacts fictifs
        List<Contact> contactsToUpdate = new List<Contact>();
        contactsToUpdate.add(testContact);

        HttpResponse response = ContactSyncAPI.syncContactStatus(contactsToUpdate);

        // Vérifiez que la réponse HTTP a un code de statut 200 (OK)
        System.assertEquals(200, response.getStatusCode());

        // Vérifiez que la réponse contient un message de réussite (facultatif)
        System.assertEquals(true, response.getBody().contains('La synchronisation des contacts a réussi.'));
    }
}
