package com.jz1501.chenhc.diploma.tfbook.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;

/**
 * 拦截器配置类
 */
@Configuration
public class WebConfigure extends WebMvcConfigurerAdapter {

    @Resource
    private LoginInterceptor loginInterceptor;

    /**
     * 覆盖拦截方法，springboot中拦截器不拦截jsp，使用本地main启动时拦截Jsp
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/cart/purchase/**", "/user/person/**")
                .excludePathPatterns("/book/**", "/category/**", "/cascade/**", "/code/**", "/cache/**");//
    }

}
