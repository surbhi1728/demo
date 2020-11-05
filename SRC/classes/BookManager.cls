@RestResource(urlMapping = '/v1/BookManager/')
global class BookManager{
    @httpPost
    global static Book__c doCreateBook(BooksInfo bookInfo){
        Book__c book = bookInfo.book;
        insert book;
        return book;
    }
    //Sample testing
    @httpGet
    global static Book__c doGetBook(){
        Book__c book = new Book__c();
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book = [SELECT id, Name, Price__c from Book__c where Id =: bookId];
        return book;
    }
	//hello
	//class test
    
    global class BooksInfo{
        Book__c book {get; set;}
    }
}