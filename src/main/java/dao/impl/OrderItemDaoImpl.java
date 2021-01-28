package dao.impl;

import dao.OrderItemDao;
import pojo.OrderItem;

import java.util.List;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:18
 **/
public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {

    @Override
    public int saveOrderItem(OrderItem orderItem) {
        String sql = "insert into t_order_item(`name`,`count`,`price`,`total_price`,`order_id`) values(?,?,?,?,?)";
        return update(sql,orderItem.getName(),orderItem.getCount(),orderItem.getPrice(),orderItem.getTotalPrice(),orderItem.getOrderId());
    }

    @Override
    public List<OrderItem> queryOrderDetilByOrderId(String orderId) {
        String sql = "select `name`,`count`,`price`,`total_price` totalPrice from t_order_item where order_id = ?";
        return queryForList(OrderItem.class,sql,orderId);
    }
}
