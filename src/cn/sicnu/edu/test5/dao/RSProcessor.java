package cn.sicnu.edu.test5.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
*@author:  Ming
*@version :2018年5月16日下午9:37:56
*/
public interface RSProcessor {
	Object process(ResultSet rs) throws SQLException;
	

}
