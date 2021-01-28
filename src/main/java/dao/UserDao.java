package dao;

import pojo.User;

/**
 * @program: myBookMall
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-28 14:00
 **/
public interface UserDao {

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User queryUserByUsername(String username);

    /**
     * 根据用户名密码查询用户
     * @param username
     * @param password
     * @return返回null则表示用户名或密码错误
     */
    User queryUserByUsernameAndPassword (String username,String password);

    /**
     * 保存用户信息
     * @param user
     * @return
     */
    int saveUser (User user);
}
