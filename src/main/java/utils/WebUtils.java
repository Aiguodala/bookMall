package utils;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @program: login
 * @description:
 * @author: A.iguodala
 * @create: 2020-12-31 14:06
 **/
public class WebUtils {
    public static <T> T copyParamToBean (Map value, T bean) {
        try {
            BeanUtils.populate(bean,value);


        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
