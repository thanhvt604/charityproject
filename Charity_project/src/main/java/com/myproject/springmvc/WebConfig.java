package com.myproject.springmvc;

import javax.servlet.MultipartConfigElement;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@Configuration
@EnableTransactionManagement
@PropertySource("/resources/application.properties")
 @PropertySource("/resources/ds/jdbc.properties")
@ComponentScan(basePackages = "com.myproject")

public class WebConfig implements WebMvcConfigurer {
	@Autowired
	private Environment env;

	
	   
   @Override
   public void addViewControllers(ViewControllerRegistry registry) {
      registry.addViewController("/").setViewName("index");
   }

   @Bean
   public ViewResolver viewResolver() {
      InternalResourceViewResolver bean = new InternalResourceViewResolver();

      bean.setViewClass(JstlView.class);
      bean.setPrefix("/WEB-INF/view/");
      bean.setSuffix(".jsp");

      return bean;
   }
   
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
   registry.addResourceHandler("/registry/**").addResourceLocations("/resources/");
   
   
   
   }
   @Bean(name = "dataSource")
   @Autowired
   public DataSource getDataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();

       // See: datasouce-cfg.properties
       dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
       dataSource.setUrl(env.getProperty("ds.url"));
      dataSource.setUsername(env.getProperty("ds.username"));
      dataSource.setPassword(env.getProperty("ds.password"));

       System.out.println("## getDataSource: " + dataSource);
       System.out.println();
       return dataSource;
   }
   @Bean(name = "transactionManager")
   public DataSourceTransactionManager getTransactionManager() {
       DataSourceTransactionManager txManager = new DataSourceTransactionManager();

       DataSource dataSource = this.getDataSource();
       txManager.setDataSource(dataSource);

       return txManager;
   }
   @Bean(name="JdbcTemplate")
   public JdbcTemplate jdbcTemplate(DataSource dataSource)
   {
       return new JdbcTemplate(dataSource);
   }
   @Bean
   public MultipartConfigElement multipartConfigElement() {
       return new MultipartConfigElement("");
   }

   @Bean
   public MultipartResolver multipartResolver() {
       org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
       multipartResolver.setMaxUploadSize(2000000);
       return multipartResolver;
   }
}
