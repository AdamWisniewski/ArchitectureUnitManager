package pl.adamWisniewski.ArchitectureUnitManager.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.jdbcAuthentication()
			.usersByUsernameQuery("SELECT login, password, active FROM password WHERE login = ?")
			.authoritiesByUsernameQuery(
					"SELECT p.login, r.permissions FROM password p left join permissions r on r.id_permissions = p.id_permissions where p.login = ?;"
					)
			.dataSource(dataSource);
//			.passwordEncoder(bCryptPasswordEncoder);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http
		    .authorizeRequests()
			.antMatchers("/employee/*").hasAnyAuthority("employee","manager","admin")
			.antMatchers("/manager/*").hasAnyAuthority("manager","admin")
			.antMatchers("/admin/*").hasAuthority("admin")
			.anyRequest().permitAll()
			.and()
			.formLogin().loginPage("/login").failureUrl("/login?error=true").defaultSuccessUrl("/")
			.usernameParameter("login")
			.passwordParameter("password")
			.and()
			.logout().logoutUrl("/logout").logoutSuccessUrl("/");
	}
}
