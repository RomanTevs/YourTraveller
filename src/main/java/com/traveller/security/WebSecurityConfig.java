package com.traveller.security;


import com.traveller.security.filters.CustomAuthFilter;
import com.traveller.security.filters.JWTFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

    private final JWTFilter jwtFilter;


    public WebSecurityConfig(JWTFilter jwtFilter) {
        this.jwtFilter = jwtFilter;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http.csrf().disable()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                    .and()
                .addFilter(customAuthFilter())
                .addFilterAfter(jwtFilter, CustomAuthFilter.class)
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/home-page/**").permitAll()
                        .requestMatchers("/logout", "/login", "/registration").permitAll()
                        .requestMatchers("/css/**", "/js/**", "/webjars/**").permitAll()
                        .anyRequest().authenticated())
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/main")
                    .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .deleteCookies("Authorization")
                .clearAuthentication(true)
                .invalidateHttpSession(false);

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public CustomAuthFilter customAuthFilter() {
        CustomAuthFilter customAuthFilter = new CustomAuthFilter();
        return customAuthFilter;
    }


}
