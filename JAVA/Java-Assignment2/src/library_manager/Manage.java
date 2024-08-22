package library_manager;

import library.Book;

public interface Manage {
    void addBook(Book book);     // Method to add a new book to the library
    void removeBook(int bookId); // Method to remove a book from the library
}