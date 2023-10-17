public class UpdateMissionStatusHandler {
    public static void handleTrigger(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        List<Account> accountsToUpdate = new List<Account>();
        List<Contact> contactsToUpdate = new List<Contact>();

        for (Account acc : newAccounts) {
            Account oldAcc = oldAccountMap.get(acc.Id);

            if (acc.MissionStatus__c == 'canceled' && oldAcc.MissionStatus__c != 'canceled') {
                acc.MissionCanceledDate__c = Date.today();
                accountsToUpdate.add(acc);
            }

            if (acc.MissionStatus__c == 'canceled' && oldAcc.MissionStatus__c != 'canceled') {
                for (Contact con : [SELECT Id, AccountId, (SELECT MissionStatus__c FROM Accounts__r) FROM Contact WHERE AccountId = :acc.Id]) {
                    Boolean allCanceled = true;
                    for (Account relatedAcc : con.Accounts__r) {
                        if (relatedAcc.MissionStatus__c != 'canceled') {
                            allCanceled = false;
                            break;
                        }
                    }
                    if (allCanceled) {
                        con.Status__c = 'Inactive';
                        contactsToUpdate.add(con);
                    }
                }
            }
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }

        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
            // Appel à la méthode pour synchroniser les contacts avec l'API
            synchronizeContactStatus(contactsToUpdate);
        }
    }
    
    public static void synchronizeContactStatus(List<Contact> contacts) {
        // Créez le tableau de données et effectuez l'appel à l'API ici
        // ...
    }
}
