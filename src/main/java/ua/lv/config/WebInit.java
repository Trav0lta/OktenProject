package ua.lv.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;


public class WebInit implements WebApplicationInitializer {
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.register(WebConfig.class);

        DispatcherServlet dispatcherServlet = new DispatcherServlet(context); //приймає на себе перші запити, і дальше розкидує їх
        DelegatingFilterProxy delegatingFilterProxy = new DelegatingFilterProxy();
        servletContext.addFilter("springSecurityFilterChain",delegatingFilterProxy).addMappingForUrlPatterns(null,false,"/*");



        ServletRegistration.Dynamic registration = servletContext.addServlet("dispatcherServlet", dispatcherServlet);
        registration.setMultipartConfig( new MultipartConfigElement("",1000000,1000000,1000000));
        registration.setLoadOnStartup(1);
        registration.addMapping("/");


//        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encoding-filter", new CharacterEncodingFilter());
//        encodingFilter.setInitParameter("encoding", "UTF-8");
//        encodingFilter.setInitParameter("forceEncoding", "true");
//        encodingFilter.addMappingForUrlPatterns(null, true, "/*");

    }
}
