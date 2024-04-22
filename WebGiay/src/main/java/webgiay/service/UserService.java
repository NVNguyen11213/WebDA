package webgiay.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import webgiay.model.User;

@Service
public class UserService extends BaseService<User> {

	@Override
	public Class<User> clazz() {
		return User.class;
	}

	public List<User> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status=1");
	}

	public List<User> findAllUsers() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status = 1 AND username != 'admin'");
	}

	@Transactional
	public void inactiveUser(User user) {
		super.saveOrUpdate(user);
	}

	public User getUserById(int userId) {
		return super.getById(userId);
	}
}
