package com.whut.wxcs.resmanager.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("catalogueService")
public class CatalogueServiceImpl extends BaseServiceImpl<Catalogue> implements
		CatalogueService {

	@Resource(name = "catalogueDao")
	@Override
	public void setBaseDao(BaseDao<Catalogue> baseDao) {
		super.setBaseDao(baseDao);
	}

	public BaseDao<Catalogue> getBaseDao() {
		return baseDao;
	}

	@Resource(name = "catalogueDao")
	private BaseDao<Catalogue> catalogueDao;
	@Resource(name = "templateDao")
	private BaseDao<Template> templateDao;
	@Resource(name = "attributeDao")
	private BaseDao<Attribute> attributeDao;

	@Override
	public List<Catalogue> getRootCatalogue() {
		String hql = "from Catalogue c where c.parent.id = 1 order by id asc";
		return catalogueDao.findEntityByHql(hql);
	}

	@Override
	public List<Catalogue> getAllCatalogue() {
		String hql = "from Catalogue ";
		return catalogueDao.findEntityByHql(hql);
	}

	@Override
	public long saveCatalogue(Catalogue model) {

		String hql = "from Catalogue c where c.parent.id = ? order by id desc";
		List<Catalogue> child = catalogueDao.findEntityByHql(hql, model
				.getParent().getId());
		if (ValidateUtil.isVaild(child)) {
			model.setId(child.get(0).getId() + 1);
		} else {
			// 设置id id规则： 一类目两位数，二类目两位数，三四五类目三位数
			long parentId = model.getParent().getId();
			// 父类目是根，即创建一个一级类目，一类目从11开始
			if (parentId == 1) {
				model.setId(11);
			}
			// 如果父类目是一级类目
			else if (parentId < 100) {
				model.setId(parentId * 100 + 1);
			}
			// 其他的
			else {
				model.setId(parentId * 1000 + 1);
			}
		}

		// 保存类目
		catalogueDao.saveEntity(model);
		// 新建模板
		this.newTemplate(model);
		return model.getId();
	}

	/*
	 * 通过类目新建一个模板，同时加入父类目的模板的属性
	 */
	private void newTemplate(Catalogue model) {
		Template template = new Template();

		if (model.getParent() != null) {
			Template parentTemplate = templateDao.getEntity(model.getParent()
					.getId());
			Set<Attribute> attributes = parentTemplate.getAttributes();
			System.out.println(attributes.size());
			if (ValidateUtil.isVaild(attributes)) {
				Set<Attribute> newAttributes = new HashSet<Attribute>(
						attributes);
				template.setAttributes(newAttributes);
			}
		}
		String templateName = model.getName() + "模板";
		String description = "";
		template.setTemplateName(templateName);
		template.setDescription(description);
		template.setCreateTime(new Date());
		template.setCatalogue(model);
		templateDao.saveEntity(template);
	}

	@Override
	public Catalogue getRootCatalogueWithAllChild() {
		String hql = "from Catalogue c where c.id = 1";
		Catalogue root = (Catalogue) catalogueDao.ubiqueResult(hql);
		getAllChild(root);
		return root;
	}

	private void getAllChild(Catalogue c) {
		if (ValidateUtil.isVaild(c.getChild())) {
			for (Catalogue catalogue : c.getChild()) {
				getAllChild(catalogue);
			}
		}
	}

	@Override
	public void deleteCatalogueWithChild(long id) {
		// 删除类目和子类目
		Catalogue catalogue = catalogueDao.getEntity(id);
		deleteCicleCatalogue(catalogue);
		// 删除属性
		String sql = "DELETE FROM TEMPLATE_ATTRIBUTE WHERE TEMPLATE_ID LIKE ?";
		attributeDao.batchEntityBySql(sql, id + "%");
		// 删除模板
		sql = "DELETE FROM TEMPLATE WHERE TEMPLATE_ID LIKE ?";
		templateDao.batchEntityBySql(sql, id + "%");
	}

	private void deleteCicleCatalogue(Catalogue catalogue) {
		if (ValidateUtil.isVaild(catalogue.getChild())) {
			for (Catalogue c : catalogue.getChild()) {
				deleteCicleCatalogue(c);
			}
		}
		catalogueDao.deleteEntity(catalogue);
	}

	@Override
	public Catalogue getCatalogueById(long id) {
		// TODO 为什么这里要初始化parent和child？ 这种情况下不能初始化ID为1 的
		Catalogue catalogue = catalogueDao.getEntity(id);
		if (id == 1) {
			return catalogue;
		}
		catalogue.getParent();
		catalogue.getParent().getChild();
		return catalogue;
	}

	@Override
	public Template getTemplate(long id) {
		Template template = templateDao.getEntity(id);
		template.getAttributes().size();
		return template;
	}

	@Override
	public Template getTemplateWithAll(long id) {
		Template template = templateDao.getEntity(id);
		template.getAttributes().size();
		template.getCatalogue();
		return template;
	}

	@Override
	public void updateTemplate(Template model) {
		String hql = "UPDATE Template t SET t.description = ? ,t.templateName = ? WHERE t.id = ?";
		templateDao.batchEntityByHql(hql, model.getDescription(),
				model.getTemplateName(), model.getId());

	}

	@Override
	public void updateAttribute(Attribute model) {
		String hql = "UPDATE Attribute a SET a.description = ? ,a.name = ?,a.type = ? , a.value = ? WHERE a.id = ?";
		templateDao.batchEntityByHql(hql, model.getDescription(),
				model.getName(), model.getType(), model.getValue(),
				model.getId());
	}

	@Override
	public void deleteAttribute(long tid, long aid) {
		String sql = "DELETE FROM TEMPLATE_ATTRIBUTE WHERE TEMPLATE_ID LIKE ? AND ATTRIBUTE_ID = ?";
		attributeDao.batchEntityBySql(sql, tid + "%", aid);
	}

	@Override
	public void saveSingleAttribute(Attribute attribute, long tid) {
		attribute.setTemplateid(tid);
		attributeDao.saveEntity(attribute);
		Catalogue catalogue = catalogueDao.getEntity(tid);
		setAttributeToTemplateAndChild(catalogue, attribute.getId());
	}

	// 给单个Template 附加 attribute
	private void setAttributeToTemplate(long tid, long aid) {
		String sql = "INSERT INTO TEMPLATE_ATTRIBUTE VALUES(?,?)";
		attributeDao.batchEntityBySql(sql, tid, aid);
	}

	// 循环给所有的子节点添加属性
	private void setAttributeToTemplateAndChild(Catalogue catalogue, long aid) {
		if (ValidateUtil.isVaild(catalogue.getChild())) {
			for (Catalogue c : catalogue.getChild()) {
				setAttributeToTemplateAndChild(c, aid);
			}
		}
		setAttributeToTemplate(catalogue.getId(), aid);
	}

	@Override
	public List<Catalogue> getChildCatalogueByParentId(long id) {
		String hql = "from Catalogue c where c.parent.id = ? order by id asc";
		return catalogueDao.findEntityByHql(hql, id);
	}

	@Override
	public void updateCatalogue(Catalogue model) {
		String hql = "UPDATE Catalogue c SET c.description = ? ,c.name = ? WHERE c.id = ?";
		templateDao.batchEntityByHql(hql, model.getDescription(),
				model.getName(), model.getId());
	}

	@Override
	public List<Attribute> getAttributesByTid(long tid) {
		Template template = templateDao.getEntity(tid);
		int size = template.getAttributes().size();
		if (size == 0) {
			return null;
		} else {
			return new ArrayList<Attribute>(template.getAttributes());
		}
	}

	@Override
	public List<Attribute> getEnumAttributesByTid(long catalogueId) {

		String sql = "select * from ATTRIBUTE where ATTRIBUTE_ID in (select ATTRIBUTE_ID from TEMPLATE_ATTRIBUTE where TEMPLATE_ID = ? ) "
				+ " and ATTRIBUTE_TYPE = 5";

		return attributeDao.findEntityBySql(sql, catalogueId);
	}

	@Override
	public Catalogue initCatalogueById(long tid) {
		Catalogue catalogue = this.getCatalogueById(tid);
		long parentid = tid;
		Catalogue parent = catalogue;

		Set<Catalogue> child;
		child = catalogue.getChild();
		if (ValidateUtil.isVaild(child))
			child.size();

		while (parentid > 1) {
			parent = parent.getParent();
			parentid = parent.getId();
		}

		return catalogue;
	}

	@Override
	public void initCatalogue() {
		Catalogue catalogue = this.getEntity(1);
		if (catalogue == null) {
			catalogue = new Catalogue();
			catalogue.setId(1);
			catalogue.setDescription("root类目");
			catalogue.setName("root");
			this.saveEntity(catalogue);
			this.newTemplate(catalogue);
		}
	}

	@Override
	public List<Attribute> getNumAttributesByTid(long tid) {
		String sql = "select * from ATTRIBUTE where ATTRIBUTE_ID in (select ATTRIBUTE_ID from TEMPLATE_ATTRIBUTE where TEMPLATE_ID = ? ) "
				+ " and ATTRIBUTE_TYPE in (2,3)";

		return attributeDao.findEntityBySql(sql, tid);
	}

	@Override
	public Double getMinNum(long id) {
		String hql = "SELECT MIN(numValue) FROM ResourceAttribute ra WHERE ra.attribute.id = ?";
		return (Double) attributeDao.ubiqueResult(hql, id);
	}

	@Override
	public Double getMaxNum(long id) {
		String hql = "SELECT MAX(numValue) FROM ResourceAttribute ra WHERE ra.attribute.id = ?";
		return (Double) attributeDao.ubiqueResult(hql, id);
	}
}
