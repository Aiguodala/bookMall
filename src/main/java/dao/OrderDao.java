package dao;

import java.util.*;
import pojo.Order;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:08
 **/
public interface OrderDao {
    /**
     * 保存总订单信息
     * @param order
     * @return
     */
    int saveOrder (Order order);

    /**
     * 查询用户的订单
     * @param userId
     * @return
     */
    List<Order> queryMyOrder (Integer userId);

    /**
     * 管理员查看所有订单
     * @return
     */
    List<Order> queryAllOrders ();

    /**
     * 更改订单状态
     */
    int changeOrderStatus(int status, String orderId);
}
