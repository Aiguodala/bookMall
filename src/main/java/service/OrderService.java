package service;

import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;

import java.util.*;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:20
 **/
public interface OrderService {
    String createOrder (Cart cart, Integer userId);

    List<Order> myOrders (Integer userId);

    List<OrderItem> orderDetil (String orderId);

    List<Order> allOrders ();

    int sendOrder(String orderId);

    int receiveOrder(String orderId);
}
