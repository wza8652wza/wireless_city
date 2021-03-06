package com.whut.wxcs.resmanager.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.util.ReflectionUtils;

/**
 *
 */

@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	@Resource(name = "sessionFactory")
	SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Criteria getCriteria() {
		return this.getSession().createCriteria(clazz);
	}

	Class<T> clazz;

	public BaseDaoImpl() {
		clazz = ReflectionUtils.getSuperGenericType(getClass());
	}

	@Override
	public long saveEntity(T t) {
		return  (Long) this.sessionFactory.getCurrentSession().save(t);
	}

	@Override
	public void saveOrUpdateEntity(T t) {
		sessionFactory.getCurrentSession().saveOrUpdate(t);
	}

	@Override
	public void updateEntity(T t) {
		sessionFactory.getCurrentSession().update(t);
	}

	@Override
	public void deleteEntity(T t) {
		sessionFactory.getCurrentSession().delete(t);
	}

	@Override
	public void batchEntityByHql(String hql, Object... objects) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}

	@Override
	public T loadEntity(long id) {
		return (T) sessionFactory.getCurrentSession().load(clazz, id);
	}

	@Override
	public T getEntity(long id) {
		return (T) sessionFactory.getCurrentSession().get(clazz, id);
	}

	@Override
	public List<T> findEntityByHql(String hql, Object... objects) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.list();

	}

	@Override
	public Object ubiqueResult(String hql, Object... objects) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.uniqueResult();
	}

	@Override
	public void batchEntityBySql(String sql, Object... objects) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}

	@Override
	public List<T> findEntityBySql(String sql, Object... objects) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql)
				.addEntity(clazz);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.list();
	}

	@Override
	public List findBySql(String sql, String name, Object[] array) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameterList(name, array);
		return query.list();
	}

}
