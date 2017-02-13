/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlpu.eva.encoding;

import java.io.IOException;
import javax.persistence.Entity;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author JinCityKasto
 */
@Entity
public class SetCharacterEncodingFilter implements Filter {

    protected String encoding = null;

    protected FilterConfig filterConfig = null;

    protected boolean ignore = true;

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.Filter#destroy()
     */
    @Override
    public void destroy() {

        this.encoding = null;
        this.filterConfig = null;

    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
     *      javax.servlet.ServletResponse, javax.servlet.FilterChain)
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        // Conditionally select and set the character encoding to be used
        if (ignore || (request.getCharacterEncoding() == null)) {
            String theencoding = selectEncoding(request);
            if (theencoding != null) {
                request.setCharacterEncoding(theencoding);
            }
        }

        // Pass control on to the next filter
        chain.doFilter(request, response);
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        this.encoding = filterConfig.getInitParameter("encoding");
        String value = filterConfig.getInitParameter("ignore");
        if (value == null) {
            this.ignore = true;
        } else if (value.equalsIgnoreCase("true")) {
            this.ignore = true;
        } else {
            this.ignore = value.equalsIgnoreCase("yes");
        }

    }

    /*
     * 
     */
    protected String selectEncoding(ServletRequest request) {

        return (this.encoding);

    }

}
