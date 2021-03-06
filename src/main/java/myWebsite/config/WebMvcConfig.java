package myWebsite.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import myWebsite.interceptor.BeforeActionInterceptor;
import myWebsite.interceptor.NeedLoginInterceptor;
import myWebsite.interceptor.NeedLogoutInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	BeforeActionInterceptor beforeActionInterceptor;
	NeedLoginInterceptor needLoginInterceptor;
	NeedLogoutInterceptor needLogoutInterceptor;
	
	@Value("${spring.config.activate.on-profile}")
	private String profileStatus;

	public WebMvcConfig(BeforeActionInterceptor beforeActionInterceptor, NeedLoginInterceptor needLoginInterceptor,
			NeedLogoutInterceptor needLogoutInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.needLogoutInterceptor = needLogoutInterceptor;
	}

	// web root가 아닌 외부 경로에 있는 리소스를 url로 불러올 수 있도록 설정
	// localhost:8080/summernoteImage/1234.jpg로 접속하면 C:/summernote_image/1234.jpg
	// 파일을 불러옴
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		if (profileStatus.equals("local")) {
			registry.addResourceHandler("/summernoteImage/**").addResourceLocations("file:///C:/summernote_image/");
		} else if (profileStatus.equals("production")){
			registry.addResourceHandler("/summernoteImage/**").addResourceLocations("file:///opt/tomcat/apache-tomcat-9.0.36/yoonseokheo.kr/images/");
		}
	}

	// 인터셉터에 적용하는 메서드
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		InterceptorRegistration beforeActionIr = registry.addInterceptor(beforeActionInterceptor);
		beforeActionIr.addPathPatterns("/**").excludePathPatterns("/resource/**");
		// 전체 url 인터셉트
		// resource 폴더 아래 정적 리소스들 제외

		InterceptorRegistration needLoginIr = registry.addInterceptor(needLoginInterceptor);
		needLoginIr.addPathPatterns("/board/write").addPathPatterns("/board/doWrite").addPathPatterns("/board/modify")
				.addPathPatterns("/board/doModify").addPathPatterns("/board/doDelete")
				.addPathPatterns("/member/doLogout").addPathPatterns("/member/withdraw")
				.addPathPatterns("/member/doWithdrawal").addPathPatterns("/member/changeLoginPw")
				.addPathPatterns("/member/updateLoginPw");

		InterceptorRegistration needLogoutIr = registry.addInterceptor(needLogoutInterceptor);
		needLogoutIr.addPathPatterns("/member/login").addPathPatterns("/member/doLogin")
				.addPathPatterns("/member/signUp").addPathPatterns("/member/doSignUp")
				.addPathPatterns("/member/forgotLoginPw").addPathPatterns("/member/findLoginPw");
	}
}
