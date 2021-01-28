package web;

import com.google.gson.Gson;
import dao.impl.BaseDao;
import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;
import pojo.User;
import service.OrderService;
import service.impl.OrderServiceImpl;
import utils.JDBCUtils;

import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:30
 **/
public class OrderServlet extends BaseServlet {

    private OrderService orderService = new OrderServiceImpl();

    /**
     * 生成订单
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cart cart = (Cart) req.getSession().getAttribute("cart");

        User loginUser = (User) req.getSession().getAttribute("user");

        if (loginUser == null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }

        Integer userId = loginUser.getId();
        String orderId = orderService.createOrder(cart, userId);

        req.getSession().setAttribute("orderId",orderId);

        resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");
    }

    protected void myOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loginUser = (User) req.getSession().getAttribute("user");

        if (loginUser == null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }

        Integer userId = loginUser.getId();

        List<Order> orders = orderService.myOrders(userId);

        req.getSession().setAttribute("orders",orders);

        resp.sendRedirect(req.getContextPath()+"/pages/order/order.jsp");
    }

    protected void orderDetil(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loginUser = (User) req.getSession().getAttribute("user");

        if (loginUser == null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }

        String orderId = req.getParameter("orderId");

        List<OrderItem> orderItems = orderService.orderDetil(orderId);
        req.getSession().setAttribute("orderItems",orderItems);

        req.getRequestDispatcher("/pages/order/my_order.jsp").forward(req,resp);
    }

    protected void allOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loginUser = (User) req.getSession().getAttribute("user");
        List<Order> orders = orderService.allOrders();

        req.getSession().setAttribute("orders",orders);

        resp.sendRedirect(req.getContextPath()+"/pages/manager/order_manager.jsp");

    }

    protected void sendOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        orderService.sendOrder(orderId);

        resp.sendRedirect(req.getContextPath()+"/orderServlet?action=allOrders");

    }

    protected void receiveOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        orderService.receiveOrder(orderId);

        resp.sendRedirect(req.getContextPath()+"/orderServlet?action=myOrders");

    }
}
