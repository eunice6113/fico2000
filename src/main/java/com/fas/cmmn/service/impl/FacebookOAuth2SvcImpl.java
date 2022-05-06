package com.fas.cmmn.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.fas.cmmn.service.OAuth2Svc;
import com.fas.model.com.SocialLoginFactory;
import com.fas.model.com.social.AbstractSocialLogin;

@Service("FacebookOAuth2Svc")
public class FacebookOAuth2SvcImpl implements OAuth2Svc {

	public String oauth2CallUrl() throws Exception {
		AbstractSocialLogin socialLogin = SocialLoginFactory.socialConnectFactory("facebook");
		return socialLogin.oauth2CallUrl();
	}
	
	public Map oauth2callback(String code) throws Exception {
		AbstractSocialLogin socialLogin = SocialLoginFactory.socialConnectFactory("facebook");
		return socialLogin.oauth2callback(code);
	}
	
	public Map socialLoginInfo() throws Exception {
		AbstractSocialLogin socialLogin = SocialLoginFactory.socialConnectFactory("facebook");
		return socialLogin.socialLoginInfo();
	}
	
	public Map oauth2callback(String oauthtoken, String oauthVerifier) throws Exception {
		return null;
	}
	
}
