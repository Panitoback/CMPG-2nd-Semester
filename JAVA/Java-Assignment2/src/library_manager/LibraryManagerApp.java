package library_manager;

import library.Book;
import library.LibraryApp;
import library.LibraryItem;

import java.util.Scanner;

public class LibraryManagerApp {
    public static void main(String[] args) {
        // Create an instance of LibraryManager with books from LibraryApp
        LibraryManager libraryManager = new LibraryManager(LibraryApp.libraryBooks);

        // Display books in the library
        System.out.println("Initial list of books in the library:");
        libraryManager.displayBooks();

        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("\nLibrary Manager Options:");
            System.out.println("1. Add a book");
            System.out.println("2. Remove a book");
            System.out.println("3. Display books");
            System.out.println("0. Exit");
            System.out.print("Choose an option: ");
            int option = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            switch (option) {
                case 1:
                    System.out.print("Enter book ID: ");
                    int newBookId = scanner.nextInt();
                    scanner.nextLine(); // Consume the newline character
                    System.out.print("Enter book name: ");
                    String newBookName = scanner.nextLine();
                    System.out.print("Enter author name: ");
                    String newAuthor = scanner.nextLine();
                    System.out.print("Enter page count: ");
                    int newPageCount = scanner.nextInt();
                    scanner.nextLine(); // Consume the newline character
                    libraryManager.addBook(new Book(newBookId, newBookName, newAuthor, newPageCount));
                    break;
                case 2:
                    System.out.print("Enter book ID to remove: ");
                    int removeBookId = scanner.nextInt();
                    scanner.nextLine(); // Consume the newline character
                    libraryManager.removeBook(removeBookId);
                    break;
                case 3:
                    System.out.println("Books currently in the library:");
                    libraryManager.displayBooks();
                    break;
                case 0:
                    System.out.println("Exiting Library Manager.");
                    scanner.close();
                    return;
                default:
                    System.out.println("Invalid option. Please choose again.");
            }
        }
    }
}
