package web;

import com.google.gson.Gson;
import pojo.Book;
import pojo.Page;
import service.BookService;
import service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-02 17:09
 **/
public class ClientBookServlet extends BaseServlet{

    private BookService bookService = new BookServiceImpl();

    /**
     * 处理分页功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter("pageNo"));
        int pageSize = Page.PAGE_SIZE;
        Page<Book> page = bookService.page(pageNo,pageSize);
        page.setUrl("client/bookServlet?action=page");
        request.setAttribute("page",page);
        request.getRequestDispatcher("/pages/client/index.jsp").forward(request,response);


    }

    /**
     * 处理查询分页
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void pageByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter("pageNo"));
        int pageSize = Page.PAGE_SIZE;
        String bookName = request.getParameter("bookName");

        Page<Book> page = bookService.pageByName(pageNo,pageSize,bookName);

        StringBuilder stringBuilder = new StringBuilder("client/bookServlet?action=pageByName");
        if (request.getParameter("bookName") != null) {
            stringBuilder.append("&bookName=");
            stringBuilder.append(request.getParameter("bookName"));
        }
        page.setUrl(stringBuilder.toString());
        request.setAttribute("page",page);


       request.getRequestDispatcher("/pages/client/index.jsp").forward(request,response);







    }
}
