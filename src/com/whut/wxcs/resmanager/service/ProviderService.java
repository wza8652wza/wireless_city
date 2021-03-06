package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Provider;

public interface ProviderService extends BaseService<Provider> {
	/**
	 * 验证服务商的登陆账号是否存在
	 */
	public boolean isLoginNameExit(String loginName);

	public Provider isLogin(Provider provider);

	public Provider getProviderByloginName(String loginName);

	public List<Provider> getCheckedProviders();

	public List<Provider> getUncheckedProviders();

	/**
	 * 批量通过审核 
	 */
	public void passListCheck(String ids);

	/**
	 * 批量下架
	 */
	public void offListCheck(String ids);

	public boolean isNameExit(String name);

}
