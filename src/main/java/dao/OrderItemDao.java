package dao;

import pojo.OrderItem;
import java.util.*;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:12
 **/
public interface OrderItemDao {
    /**
     *生成订单详情
     * @param orderItem
     * @return
     */
    int saveOrderItem (OrderItem orderItem);

    List<OrderItem> queryOrderDetilByOrderId (String orderId);
}
