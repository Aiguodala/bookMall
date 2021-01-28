package service;

import pojo.User;

/**
 * @program: myBookMall
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-28 14:18
 **/
public interface UserService {
    /**
     * 注册用户
     * @param user
     */
    public void registUser (User user);

    /**
     * 登录
     * @param user
     * @return
     */
    public User login (User user);

    /**
     * 判断用户名是否存在
     * @param username
     * @return
     */
    public boolean usernameIsExist (String username);
}
