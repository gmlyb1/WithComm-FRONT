package com.with.community.common;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class AppConfig {

	 	@Bean
	    public CommonsMultipartResolver multipartResolver() throws IOException {
	        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	        resolver.setMaxUploadSize(50000000); // 50MB
	        // Set the temporary upload directory if needed
	        resolver.setUploadTempDir(new FileSystemResource("/resources/upload/mem_Image"));
	        return resolver;
	    }
}
