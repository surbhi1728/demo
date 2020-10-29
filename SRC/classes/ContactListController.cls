public class ContactListController {
	@AuraEnabled
    public static List<Contact> getContactList(){
        List<Contact> ContactList = new List<Contact>([SELECT Id, FirstName, LastName,Phone, Email from Contact where Email != NULL]);
        return ContactList;
    }
	//hello world
}