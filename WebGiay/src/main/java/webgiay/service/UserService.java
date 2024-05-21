package webgiay.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import webgiay.dto.Jw27Constants;
import webgiay.model.User;

@Service
public class UserService extends BaseService<User> implements Jw27Constants{

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
	
	// Phương thức kiểm tra (1) file có được upload hay không?
		public boolean isUploadFile(MultipartFile file) {
			// file null hoặc tên file rỗng
			if (file == null || file.getOriginalFilename().isEmpty()) {
				return false; // Không upload
			}
			return true; // Có upload
		}
	
	@Transactional
	public User saveAddUser(User user, MultipartFile avatarFile)
			throws IOException {
		// Lưu avatar vào file
		if (isUploadFile(avatarFile)) {
			// Lưu file vào thư mục User/Avatar
			String path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đường dẫn vào bảng tbl_user
			user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
		}
		return super.saveOrUpdate(user);
	}

	// Save edit user
	@Transactional
	public User saveEditUser(User user, MultipartFile avatarFile)
			throws IOException {
		// Lay produc trong db
		User dbUser = super.getById(user.getId());
		// Luu avatar file moi neu nguoi dung co upload avatar
		if (isUploadFile(avatarFile)) { // Co upload file avatar

			// Xoa avatar cu (Xoa file avatar)
			String path = FOLDER_UPLOAD + dbUser.getAvatar();
			File file = new File(path);
			file.delete();

			// Lưu file avatar mới vào thư mực User/Avatar
			path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đường dẫn của avatar mới vào bảng tbl_user
			user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
		} else { // Người dùng không upload avatar file
			// giữ nguyên avatar cũ
			user.setAvatar(dbUser.getAvatar());
		}
		return super.saveOrUpdate(user);
	}

	@Transactional
	public User saveProfile(User user, MultipartFile avatarFile)
			throws IOException {
		// Lay produc trong db
		User dbUser = super.getById(user.getId());
		user.setPassword(dbUser.getPassword());
	    user.setUsername(dbUser.getUsername());
	    user.setDescription(dbUser.getDescription());
	    // Lấy giá trị ban đầu của các trường create_date và update_date
	    Date createDate = dbUser.getCreateDate();
	    Date updateDate = dbUser.getUpdateDate();
	    // Thiết lập lại các trường create_date và update_date với giá trị ban đầu
	    user.setCreateDate(createDate);
	    user.setUpdateDate(updateDate);
	    
	    user.setUserCreateUser(dbUser.getUserCreateUser());
	    user.setUserUpdateUser(dbUser.getUserUpdateUser());
		// Luu avatar file moi neu nguoi dung co upload avatar
		if (isUploadFile(avatarFile)) { // Co upload file avatar

			// Xoa avatar cu (Xoa file avatar)
			String path = FOLDER_UPLOAD + dbUser.getAvatar();
			File file = new File(path);
			file.delete();

			// Lưu file avatar mới vào thư mực User/Avatar
			path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đường dẫn của avatar mới vào bảng tbl_user
			user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
			 return super.saveOrUpdate(user);
		} else { // Người dùng không upload avatar file
			// giữ nguyên avatar cũ
			user.setAvatar(dbUser.getAvatar());
			
		    return super.saveOrUpdate(user);
		}
	}
	
	//Delete User
	@Transactional
	public void deleteUser(User user) {
		// Xoa file avatar trong thu muc Product/Avatar
		String path = FOLDER_UPLOAD + user.getAvatar();
		File file = new File(path);
		file.delete();
		super.delete(user);
	}
	
}
