package com.desmond_david.SpringPaste;

import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
public class SpringPasteApplicationConfiguration {
	
	@Autowired
	private Environment env;
	
	Logger logger = Logger.getLogger(getClass().getName());
	
	@Bean
	public DataSource pastesDataSource() {
		logger.info(">>>>> Setting up C3P0 data source");
		ComboPooledDataSource pastesDataSource = new ComboPooledDataSource();
		
		try {
			pastesDataSource.setDriverClass(env.getProperty("pastes.jdbc.driver"));
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}
		
		logger.info(">>>>> jdbc.driver: " + env.getProperty("pastes.jdbc.driver"));
		
		pastesDataSource.setJdbcUrl(env.getProperty("pastes.jdbc.url"));
		pastesDataSource.setUser(env.getProperty("pastes.jdbc.user"));
		pastesDataSource.setPassword(env.getProperty("pastes.jdbc.password"));
		
		logger.info(">>>>> jdbc.url: " + env.getProperty("pastes.jdbc.url"));
		logger.info(">>>>> jdbc.user: " + env.getProperty("pastes.jdbc.user"));
		logger.info(">>>>> jdbc.password: " + env.getProperty("pastes.jdbc.password"));
		
		pastesDataSource.setInitialPoolSize(Integer.parseInt(env.getProperty("pastes.connection.pool.initialPoolSize")));
		pastesDataSource.setMinPoolSize(Integer.parseInt(env.getProperty("pastes.connection.pool.minPoolSize")));
		pastesDataSource.setMaxPoolSize(Integer.parseInt(env.getProperty("pastes.connection.pool.maxPoolSize")));
		pastesDataSource.setMaxIdleTime(Integer.parseInt(env.getProperty("pastes.connection.pool.maxIdleTime")));
		
		logger.info(">>>>> Setting up C3P0 data source....done");
		
		return pastesDataSource;
	}
	
	@Bean 
	public LocalSessionFactoryBean hibernateSessionFactory() {
		logger.info(">>>>> Initiating local hibernate session factory");
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(pastesDataSource());
		sessionFactory.setPackagesToScan("com.desmond_david.SpringPaste.entities");

		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		hibernateProperties.setProperty("hibernate.show_sql", "true");
		hibernateProperties.setProperty("hibernate.temp.use_jdbc_metadata_defaults","false");
		
		sessionFactory.setHibernateProperties(hibernateProperties);
		logger.info(">>>>> Initiating local hibernate session factory...Done");
		
		return sessionFactory;
	}
	
	@Bean
	public HibernateTransactionManager myTransactionManager() {
		HibernateTransactionManager txmanager = new HibernateTransactionManager();
		txmanager.setSessionFactory(hibernateSessionFactory().getObject());
		return txmanager;
	}
	
/*	@Bean
	public EntityManager entityManager(LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
		return localContainerEntityManagerFactoryBean.getObject().createEntityManager();
	}*/
}
