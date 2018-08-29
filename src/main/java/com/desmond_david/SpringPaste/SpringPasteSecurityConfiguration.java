package com.desmond_david.SpringPaste;

import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SpringPasteSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource pastesDataSource;
	
	Logger logger = Logger.getLogger(getClass().getName());

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		logger.info(">>>>> Setting authentication to datasource");
		auth.jdbcAuthentication().dataSource(pastesDataSource);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/paste").permitAll()
				.antMatchers("/pastes").authenticated()
				.antMatchers("/getAllPastes").authenticated()
				.antMatchers("/admin").hasRole("ADMIN")
				.antMatchers("/manageUsers").hasRole("ADMIN")
				.antMatchers("/").authenticated()
			.and()
				.formLogin()
					.loginPage("/login")
					.loginProcessingUrl("/authenticateUser")
					.permitAll()
			.and()
				.logout().permitAll();
	}

}
