package webgiay.service;


import org.springframework.stereotype.Service;

import webgiay.model.User;

@Service
public class UserDetailsServiceImpl extends BaseService<User> {
	
	@Override
	public Class<User> clazz() {
		return User.class;
	}
	
	
}
