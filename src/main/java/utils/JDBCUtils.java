package utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @program: myBookMall
 * @description: 数据库连接工具
 * @author: A.iguodala
 * @create: 2020-12-28 12:57
 **/
public class JDBCUtils {
    private static DataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();



    static {

        try {
            Properties pros = new Properties();
            InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            pros.load(is);
           dataSource = DruidDataSourceFactory.createDataSource(pros);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     * @return
     */
    public static Connection getConnection() {

        Connection conn = conns.get();
        if (conn == null) {
            try {
                conn = dataSource.getConnection();
                conns.set(conn);

                conn.setAutoCommit(false);//设置手动管理事务
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return conn;
    }

    /**
     * 提交事务并且关闭连接
     */
    public static void commitAndClose () {
        Connection connection = conns.get();

        if (connection != null) {
            try {
                connection.commit();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        conns.remove();
    }

    /**
     * 回滚事务关闭连接
     */
    public static void rollbackAndClose () {
        Connection connection = conns.get();

        if (connection != null) {
            try {
                connection.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        conns.remove();
    }

    /**
     * 关闭连接放回连接池
     * @param conn

    public static void close (Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
     */
}
