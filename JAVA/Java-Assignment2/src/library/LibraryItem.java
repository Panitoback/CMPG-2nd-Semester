package library;

import java.util.List;

public abstract class LibraryItem {

    private final int item_ID;        // private property
    public String item_Name;          // public property
    protected boolean is_Available;   // protected property

    // A default constructor
    public LibraryItem() {
        this.item_ID = 0;             // Default item_ID
        this.item_Name = "Unknown";   // Default item name
        this.is_Available = true;     // Default availability status
    }

    // Custom constructor with two parameters
    public LibraryItem(int item_ID, String item_Name) {
        this.item_ID = item_ID;
        this.item_Name = item_Name;
        this.is_Available = true;     // Default availability status
    }

    // Method to set the availability status of the library item
    public void setAvailable(boolean isAvailable) {
        this.is_Available = isAvailable;
    }

    // Method to return the unique identifier (item_ID) of the library item
    public int get_Item_ID() {
        return item_ID;
    }

    // Method to return the name (item_Name)
    public String get_Item_Name() {
        return item_Name;
    }

    // Method to return the availability status (is_Available)
    public boolean is_Available() {
        return is_Available;
    }

    // A static method to print a welcome message
    public static void print_Welcome_Message() {
        System.out.println("Welcome to the Library!");
    }

    // Method to print the details of the library item
    public void display_Info() {
        System.out.println("Item ID: " + item_ID);
        System.out.println("Item Name: " + item_Name);
        System.out.println("Available: " + is_Available);
    }

    // Abstract method to be implemented by subclasses
    public abstract void check_Out_Item();

    // Abstract method to be implemented by subclasses
    public abstract void return_Item();

    // Static method to display available books
    public static void display_Available_Books(List<? extends LibraryItem> items) {
        System.out.println("Available items in the library:");
        for (LibraryItem item : items) {
            item.display_Info();
            System.out.println();
        }
    }

    // Static method to find a book by its ID
    public static LibraryItem find_Book_By_ID(List<? extends LibraryItem> items, int itemId) {
        for (LibraryItem item : items) {
            if (item.get_Item_ID() == itemId) {
                return item;
            }
        }
        return null;
    }
}
