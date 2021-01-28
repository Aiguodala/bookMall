package service;

import pojo.Book;
import pojo.Page;

import java.util.List;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-31 17:22
 **/
public interface BookService {
    void addBook (Book book);

    void deleteBookById (Integer id);

    void updateBook (Book book);

    Book queryBookById (Integer id);

    List<Book> queryBooks();

    Page<Book> page(int pageNo, int pageSize);

    Page<Book> pageByName(int pageNo, int pageSize, String bookName);
}
