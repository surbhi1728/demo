@isTest
public class BookManager_UnitTest{
      public static testMethod void unitTest_PostMethod(){
        RestRequest request = new RestRequest();
        request.requestURI = 'services/apexrest/v1/BookManagement/';
        request.httpMethod = 'POST';
        
        request.addHeader('Content-Type','application/json');
        request.addHeader('ACCEPT','application/json');
        
        BookManager.BooksInfo bInfo = new BookManager.BooksInfo();
        String requestBody = JSON.serialize(bInfo);
        request.requestBody = Blob.valueof(requestBody);
        
        Test.startTest();
        	Book__c book = BookManager.doCreateBook(bInfo);
        	System.assertEquals('test Book', book.Name);
            System.assertNotEquals(null, book.Id);
        Test.stopTest();
        
    }
	//hello
    
     public static testMethod void unitTest_UpdateMethod(){
         Id bookId = CreateBookRecord();
         RestRequest request = new RestRequest();
         request.requestURI = '/services/apexrest/v1/BookManagement/';
         request.httpMethod = 'POST';
         
         request.addHeader('Content-Type', 'application/json');
         request.addHeader('Accept', 'application/json');
         
         request.requestBody = Blob.Valueof('Updated Book Name');
         request.addParameter('Id',bookId);
         
         RestContext.request = request;
         
         Test.startTest();
         	Book__c book = BookManager.doUpdateeBook('Updated Book Name');
         	System.assertEquals('Updated Book Name', book.Name);
         	System.assertNotEquals(null, book.Id);
         Test.stopTest();
            
            

     }
    
    public static testmethod void unitTest_GetMethod(){
        Id bookId = CreateBookRecord();
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/v1/BookManagement/';
        request.httpMethod = 'GET';
         
        request.addHeader('Content-Type', 'application/json');
        request.addHeader('Accept', 'application/json');
        
        request.addParameter('Id', bookId);
        
        RestContext.request = request;
        
        Test.startTest();
         	Book__c book = BookManager.doGetBook();
         	System.assertEquals('Another Book', book.Name);
         	System.assertNotEquals(null, book.Id);
         Test.stopTest();
        
    }
    
    public static testmethod void unitTest_DeleteMethod(){
        Id bookId = CreateBookRecord();
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/v1/BookManagement/';
        request.httpMethod = 'DELETE';
         
        request.addHeader('Content-Type', 'application/json');
        request.addHeader('Accept', 'application/json');
        
        request.addParameter('Id', bookId);
        
        RestContext.request = request;
        
        Test.startTest();
         	String deletedMessage = BookManager.doDeleteBook();
         	System.assertEquals('record Deleted', deletedMessage);
         	
         Test.stopTest();
        
    }
    
    public static Id CreateBookRecord(){
        Book__c book = new Book__c(Name='Another book');
        insert book;
        return book.Id;
    }
}