package dao.impl;

import dao.BookDao;
import pojo.Book;

import java.util.List;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-31 17:04
 **/
public class BookDaoImpl extends BaseDao implements BookDao {
    @Override
    public int addBook(Book book) {
        String sql = "insert into t_book(`name` , `author` , `price` , `sales` , `stock` , `img_path`)values(?,?,?,?,?,?)";
        return update(sql,book.getName(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getImgPath());
    }

    @Override
    public int deleteBookById(Integer id) {
        String sql = "delete from t_book where id = ?";
        return update(sql,id);
    }

    @Override
    public int updateBook(Book book) {
        String sql = "update t_book set `name`=? , `author`=? , `price`=? , `sales`=? , `stock`=?  where id=?";
        return update(sql,book.getName(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getId());
    }

    @Override
    public Book queryBookById(Integer id) {
        String sql = "select `id` , `name` , `author` , `price` , `sales` , `stock` , `img_path` imgPath from t_book where id=?";
        return queryForOne(Book.class,sql,id);
    }

    @Override
    public List<Book> queryBooks() {
        String sql = "select `id` , `name` , `author` , `price` , `sales` , `stock` , `img_path` imgPath from t_book";
        return queryForList(Book.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from t_book";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Book> queryForPageItems(int begin, int pageSize) {
        String sql = "select `id` , `name` , `author` , `price` , `sales` , `stock` , `img_path` imgPath from t_book limit ?,?";
        return queryForList(Book.class,sql,begin,pageSize);
    }

    @Override
    public Integer queryForPageTotalCountByName(String bookName) {
        String sql = "select count(*) from t_book where name like ?";

        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < bookName.length(); i++) {
            stringBuilder.append("%"+bookName.charAt(i));
        }
        stringBuilder.append("%");
        bookName = stringBuilder.toString();
        Number count = (Number) queryForSingleValue(sql,bookName);
        return count.intValue();
    }

    @Override
    public List<Book> queryForPageItemsByName(int begin, int pageSize, String bookName) {
        String sql = "select `id` , `name` , `author` , `price` , `sales` , `stock` , `img_path` imgPath from t_book where name like ? limit ?,?";
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < bookName.length(); i++) {
            stringBuilder.append("%"+bookName.charAt(i));
        }
        stringBuilder.append("%");
        bookName = stringBuilder.toString();
        return queryForList(Book.class,sql,bookName,begin,pageSize);
    }
}
