package library_manager;

import library.Book;
import library.LibraryItem;

import java.util.List;

public class LibraryManager implements Manage {
    private List<Book> books;

    public LibraryManager(List<Book> books) {
        this.books = books;
    }

    @Override
    public void addBook(Book book) {
        books.add(book);
        System.out.println(book.get_Item_Name() + " has been added to the library.");
    }

    @Override
    public void removeBook(int bookId) {
        Book bookToRemove = null;
        for (Book book : books) {
            if (book.get_Item_ID() == bookId) {
                bookToRemove = book;
                break;
            }
        }
        if (bookToRemove != null) {
            books.remove(bookToRemove);
            System.out.println(bookToRemove.get_Item_Name() + " has been removed from the library.");
        } else {
            System.out.println("Book with ID " + bookId + " not found.");
        }
    }

    // Method to display all books in the library
    public void displayBooks() {
        if (books.isEmpty()) {
            System.out.println("No books in the library.");
        } else {
            LibraryItem.display_Available_Books(books);
        }
    }
}
