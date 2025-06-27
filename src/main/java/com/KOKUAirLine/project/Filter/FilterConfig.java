package com.KOKUAirLine.project.Filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<XSSFilter> xssFilterRegistration() {
        FilterRegistrationBean<XSSFilter> registration = new FilterRegistrationBean<>();
        registration.setFilter(new XSSFilter());
        registration.addUrlPatterns("/*"); // 모든 URL에 적용
        registration.setName("XSSFilter");
        registration.setOrder(1); // 필터 실행 순서
        return registration;
    }
}
