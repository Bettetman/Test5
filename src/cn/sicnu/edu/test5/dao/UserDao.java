package cn.sicnu.edu.test5.dao;

import java.util.List;

import cn.sicnu.edu.test5.entity.*;

/**
*@author:  Ming
*@version :2018年5月16日下午9:42:12
*/
public interface UserDao {
	//查找用户
	public boolean isExsitAccount(String account);
	
	public List<User>  getAllUser();
	
	public User getUserByAccount(String account);
	
	//插入用户
	public boolean insertAUser(User user);
	
	//更改信息
	
	//删除用户
	public boolean deleteAUserByAccount(String account);
	public boolean deleteAUser(User user);

}
