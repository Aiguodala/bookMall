package dao.impl;

import java.util.List;
import dao.OrderDao;
import pojo.Order;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2021-01-04 16:15
 **/
public class OrderDaoImpl extends BaseDao implements OrderDao {


    @Override
    public int saveOrder(Order order) {
        String sql = "insert into t_order(`order_id`,`create_time`,`price`,`status`,`user_id`) values(?,?,?,?,?)";

        return update(sql,order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserId());
    }

    @Override
    public List<Order> queryMyOrder(Integer userId) {

        String sql = "select `order_id` orderId,`create_time` createTime,`price`,`status` from t_order where `user_id`=?";
        return queryForList(Order.class,sql,userId);
    }

    @Override
    public List<Order> queryAllOrders() {

        String sql = "select `order_id` orderId,`create_time` createTime,`price`,`status` from t_order";

        return queryForList(Order.class,sql);
    }

    @Override
    public int changeOrderStatus(int status, String orderId) {
        String sql = "update t_order set `status` = ? where order_id=?";
        return update(sql,status,orderId);

    }

}
