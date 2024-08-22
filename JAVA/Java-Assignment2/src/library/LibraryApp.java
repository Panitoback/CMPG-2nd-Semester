package library;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class LibraryApp {
    public static List<Book> libraryBooks = new ArrayList<>();

    public static void main(String[] args) {
        // Print a welcome message
        LibraryItem.print_Welcome_Message();

        // Create a list of books available in the library
        libraryBooks.add(new Book(101, "Book 1", "Zayed", 400));
        libraryBooks.add(new Book(102, "Book 2", "Esteban", 400));
        libraryBooks.add(new Book(103, "Book 3", "Zayed", 400));

        // Display available books
        LibraryItem.display_Available_Books(libraryBooks);

        try (Scanner scanner = new Scanner(System.in)) {
            while (true) {
                // Take user input to choose a book to check out or return
                System.out.print("Enter the ID of the book you want to check out or return (or 0 to exit): ");
                int bookId = scanner.nextInt();
                if (bookId == 0) break;

                // Search for the book
                LibraryItem selectedBook = LibraryItem.find_Book_By_ID(libraryBooks, bookId);
                if (selectedBook != null) {
                    System.out.print("Enter 1 to check out or 2 to return the book: ");
                    int action = scanner.nextInt();
                    
                    switch (action) {
                        case 1:
                            selectedBook.check_Out_Item();
                            break;
                        case 2:
                            selectedBook.return_Item();
                            break;
                        default:
                            System.out.println("Invalid action. Please enter 1 to check out or 2 to return.");
                            break;
                    }
                } else {
                    System.out.println("Book with ID " + bookId + " not found.");
                }

                // Display available books after each operation
                LibraryItem.display_Available_Books(libraryBooks);
            }
        }
    }
}
