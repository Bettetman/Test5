package cn.sicnu.edu.test5.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.sicnu.edu.test5.dao.BaseDao;
import cn.sicnu.edu.test5.dao.RSProcessor;
import cn.sicnu.edu.test5.dao.UserDao;
import cn.sicnu.edu.test5.entity.User;

/**
*@author:  Ming
*@version :2018年5月16日下午9:49:25
*/
public class UserDaoimpl extends BaseDao implements UserDao {

	public UserDaoimpl() {
		// TODO Auto-generated constructor stub
	}
/**
	 * 增、删、改操作
	 * @param account
	 *            参数 account
	 * @return   是否存在
 */
	@Override
	public boolean isExsitAccount(String account) {
		String sql="select * from users where account=?";
		BaseDao dao = new BaseDao();	
		RSProcessor processor =new RSProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				User user = null;
				if(rs.next()) {
				user =new User(rs.getString("account"),rs.getString("name"),rs.getString("password"),rs.getString("email"),rs.getString("describe"));
				       
				}
				System.out.println(user==null);
				return user;
			}
		};
        return   dao.executeQuery(processor, sql, account)==null?false:true;
	}

	@Override
	public List<User> getAllUser() {
		String sql ="select * from users";
		BaseDao dao = new BaseDao();
		RSProcessor processor = new RSProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
	           List<User> list = new ArrayList<User>();
	           while(rs.next())
	           {
	        	   
	        	   String account = rs.getString("account");
	        	   String name = rs.getString("name");
	        	   String password =rs.getString("password");
	        	   String email =rs.getString("email");
	        	   String describe =rs.getString("describe");        	   
	        	   User user =new User(account, name, password, email, describe);
	        	   list.add(user);
	           }
				return list;
			}
		};
		List<User> lt= (List<User>) dao.executeQuery(processor, sql);
		return lt;
	}

	@Override
	public User getUserByAccount(String account) {
	     String sql = "select * from users where account =?";
	     BaseDao dao = new BaseDao();
	     RSProcessor processor = new RSProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				  User  user=null;
			  if(rs.next())
			  {
				  user =new User(rs.getString("account"),rs.getString("name"),
						  								rs.getString("password"),rs.getString("email"),rs.getString("describe"));
			  }
				return user;
			}
		};
		User user1= (User) dao.executeQuery(processor, sql, account);
		return user1;
	}

	@Override
	public boolean insertAUser(User user) {

		String sql=" insert into users (`account`, `password`, `name`, `email`, `describe`) values(?, ?, ?, ?, ?)";
		BaseDao dao =new BaseDao();
		if(isExsitAccount(user.getAccount()))
		{
			return false;
		}
		return  dao.executeUpdate(sql,user.getAccount(),user.getPassword(),
										user.getName(),user.getEmail(),user.getDescribe())>0?true:false;
	}

	@Override
	public boolean deleteAUserByAccount(String account) {
			String sql ="delete from users  where  account=?";
			BaseDao baseDao =new BaseDao();
			if(!isExsitAccount(account))
			{
				return false;
			}
			
		   return  baseDao.executeUpdate(sql, account)>0?true:false;
	}

	@Override
	public boolean deleteAUser(User user) {
		return deleteAUserByAccount(user.getAccount());
	}

}
