package com.example.stumanage.interceptor;

import com.example.stumanage.vo.TbAdminVo;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆验证拦截器
 */
public class IdentityInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        TbAdminVo tbAdminVo=(TbAdminVo)request.getSession().getAttribute("tbAdmin");
		if (tbAdminVo!=null) {
			// 继续往后
			return true;
		}
		request.getRequestDispatcher("/admin/login").forward(request, response);
		// 不往后走
		return false;

	}
}
