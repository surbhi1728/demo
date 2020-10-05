global class BookPlanner{
    global class BookPlan{
        webservice String bookName;
        webservice Decimal price;
        webservice String author;
        webservice String bookId;
    }
        
    webservice static BookPlan CreateBook(BookPlan plan){
        Book__c book = new Book__c();
        book.Name = plan.bookName;
        book.Price__c = plan.price;
        book.Author__c = plan.author;
        insert book;
        return plan;
        }
    }