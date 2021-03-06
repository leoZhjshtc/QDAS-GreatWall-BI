package cn.qdas.core.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.qdas.core.bean.Permission;
import cn.qdas.core.bean.Role;
import cn.qdas.core.bean.User;
import cn.qdas.core.dao.MainPageMapper;
import cn.qdas.core.db.DataSource;
import cn.qdas.core.service.IMainPageService;

@Service
public class MainPageServiceImpl implements IMainPageService{
	@Resource
	MainPageMapper mpm;
	public User checkLogin(User user) {
		User dbUser=mpm.checkLogin(user);
		return dbUser;
	}
	public User getUserRole(User user) {
		User dbUser=mpm.getUserRole(user);
		return dbUser;
	}
	public List getPermissionByUser(User user) {
		User dbUser=mpm.getUserRole(user);
		List<Permission> permissionList=new ArrayList<Permission>();
		if(dbUser!=null) {
			List<Role> roleList=dbUser.getRoleList();
			for(int i=0;i<roleList.size();i++) {
				List<Permission> plist=roleList.get(i).getPermissionList();
				for(int j=0;j<plist.size();j++) {
					permissionList.add(plist.get(j));
				}
			}
			HashSet set=new HashSet(permissionList);
			permissionList.clear();
			permissionList.addAll(set);
		}
		return permissionList;
	}
}
