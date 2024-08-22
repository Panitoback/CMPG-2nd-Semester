package library;

// the subclass
public class Book extends LibraryItem {
    private final String author;
    private final int pageCount;

    // this Constructor calls the superclass constructor with item_ID and item_Name
    public Book(int item_ID, String item_Name, String author, int pageCount) {
        super(item_ID, item_Name);    // Call to superclass constructor to initialize item_ID and item_Name
        this.author = author;         // Initialize the author field
        this.pageCount = pageCount;   // Initialize the pageCount field
    }

    // Overriding the displayInfo method from the superclass to include author and page count
    @Override
    public void display_Info() {
        super.display_Info();         // Call to superclass method to display common information
        System.out.println("Author: " + author);
        System.out.println("Page Count: " + pageCount);
    }

    // Implementing the abstract method from the superclass
    @Override
    public void check_Out_Item() {
        if (is_Available()) {
            setAvailable(false);
            System.out.println(get_Item_Name() + " has been checked out.");
        } else {
            System.out.println(get_Item_Name() + " is not available for checkout.");
        }
    }

    // Implementing the abstract method from the superclass
    @Override
    public void return_Item() {
        if (!is_Available()) {
            setAvailable(true);
            System.out.println(get_Item_Name() + " has been returned.");
        } else {
            System.out.println(get_Item_Name() + " was not checked out.");
        }
        
    }

}   