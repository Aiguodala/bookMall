package dao;

import java.util.List;
import pojo.Book;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-31 17:00
 **/
public interface BookDao {
    /**
     * 添加图书
     * @param book
     * @return
     */
    int addBook (Book book);

    /**
     * 通过id删除图书
     * @param id
     * @return
     */
    int deleteBookById (Integer id);

    /**
     * 更新图书
     * @param book
     * @return
     */
    int updateBook (Book book);

    /**
     * 通过图书编号查询图书
     * @param id
     * @return
     */
    Book queryBookById (Integer id);

    /**
     * 查询所有图书
     * @return
     */
    List<Book> queryBooks();

    /**
     * 查询所有页面数量
     * @return
     */
    Integer queryForPageTotalCount();

    /**
     * 查询页面中的所有图书
     * @param begin
     * @param pageSize
     * @return
     */
    List<Book> queryForPageItems(int begin, int pageSize);

    /**
     * 搜索框实现
     * @param bookName
     * @return
     */
    Integer queryForPageTotalCountByName(String bookName);

    /**
     * 查询后分页
     * @param begin
     * @param pageSize
     * @param bookName
     * @return
     */
    List<Book> queryForPageItemsByName(int begin, int pageSize, String bookName);


}
