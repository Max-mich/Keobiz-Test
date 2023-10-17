@isTest
public class AccountTriggerHandlerTest {
    @isTest
    static void testHandleCancelledMissions() {
        // Créez un compte fictif avec une mission annulée
        Account testAccount = new Account(
            Name = 'Test Account',
            MissionStatus__c = 'canceled'
        );
        insert testAccount;

        // Créez un contact fictif lié au compte
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            IsActive__c = true
        );
        insert testContact;

        // Créez une relation compte-contact
        AccountContactRelation acr = new AccountContactRelation(
            AccountId = testAccount.Id,
            ContactId = testContact.Id
        );
        insert acr;

        // Appelez la méthode handleCancelledMissions pour déclencher les actions
        List<Account> accountsToUpdate = new List<Account>{ testAccount };
        Test.startTest();
        AccountTriggerHandler.handleCancelledMissions(accountsToUpdate);
        Test.stopTest();

        // Vérifiez que le champ MissionCanceledDate__c a été mis à jour
        Account updatedAccount = [SELECT MissionCanceledDate__c FROM Account WHERE Id = :testAccount.Id];
        System.assertNotEquals(null, updatedAccount.MissionCanceledDate__c);

        // Vérifiez que le champ IsActive__c du contact a été mis à jour
        Contact updatedContact = [SELECT IsActive__c FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals(false, updatedContact.IsActive__c);
    }
}
