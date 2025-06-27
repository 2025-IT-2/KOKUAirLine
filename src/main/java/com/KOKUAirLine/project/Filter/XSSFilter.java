package com.KOKUAirLine.project.Filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

public class XSSFilter implements Filter{
  public FilterConfig filterConfig;

  public void init(FilterConfig filterConfig) throws SecurityException {
      this.filterConfig = filterConfig;
  }

  public void destroy(){
      this.filterConfig = null;
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
  }
}
