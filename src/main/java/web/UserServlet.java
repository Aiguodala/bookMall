package web;

import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

/**
 * @program: myBookMall
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-30 23:08
 **/
public class UserServlet extends BaseServlet{
    private UserService userService = new UserServiceImpl();

    /**
     * 处理注销功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void loginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        System.out.println(request.getContextPath());
        response.sendRedirect(request.getContextPath());
    }
    /**
     * 处理登录功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User loginUser = userService.login(new User(null, username, password, null));

        if (loginUser == null) {

            request.setAttribute("msg","用户名或密码错误");
            request.setAttribute("username",username);

            request.getRequestDispatcher("/pages/user/login.jsp").forward(request,response);
        }else {

            request.getSession().setAttribute("user",loginUser);

            request.getRequestDispatcher("/pages/user/login_success.jsp").forward(request,response);
        }
    }

    /**
     * 处理注册功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String token = (String) request.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        request.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        String code = request.getParameter("code");

        User user = WebUtils.copyParamToBean(request.getParameterMap(),new User());

        if (token != null && token.equalsIgnoreCase(code)) {
            if (userService.usernameIsExist(user.getUsername())) {
                request.setAttribute("msg","用户名已存在");
                request.setAttribute("username",user.getPassword());
                request.setAttribute("email",user.getEmail());

                request.getRequestDispatcher("/pages/user/regist.jsp").forward(request,response);
            }else {
                userService.registUser(new User(null, user.getUsername(), user.getPassword(), user.getEmail()));
                User loginUser = userService.login(new User(null, user.getUsername(), user.getPassword(), null));
                request.getSession().setAttribute("user",loginUser);
                request.getRequestDispatcher("/pages/user/regist_success.jsp").forward(request,response);
            }

        }else {
            request.setAttribute("msg","验证码错误");
            request.setAttribute("username",user.getUsername());
            request.setAttribute("email",user.getEmail());

            request.getRequestDispatcher("/pages/user/regist.jsp").forward(request,response);
        }
    }


}
