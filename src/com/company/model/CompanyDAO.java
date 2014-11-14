package com.company.model;

import hibernate.util.HibernateUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;

public class CompanyDAO implements ICompanyDAO {

	private static final String GET_ALL_STMT =
		      "FROM CompanyVO order by comID";

	@Override
	public void insert(CompanyVO comVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(comVO);
			session.getTransaction().commit();
		} catch (RuntimeException rex) {
			session.beginTransaction().rollback();
			throw rex;
		}
	}

	@Override
	public void update(CompanyVO comVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(comVO);
			session.getTransaction().commit();
		} catch (RuntimeException rex) {
			session.beginTransaction().rollback();
			throw rex;
		}
	}

	

	@Override
	public void delete(Integer comID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
//			CompanyVO comVO = (CompanyVO)session.get(CompanyVO.class, comID);
			CompanyVO comVO = new CompanyVO();
			comVO.setComID(comID);
			session.delete(comVO);
			session.getTransaction().commit();
		} catch(RuntimeException rex) {
			session.getTransaction().rollback();
			throw rex;
		}
	}

	@Override
	public CompanyVO findByPrimaryKey(Integer comID) {
		CompanyVO comVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			comVO = (CompanyVO) session.get(CompanyVO.class, comID);
			session.beginTransaction().commit();
		} catch(RuntimeException rex) {
			session.beginTransaction().rollback();
			throw rex;
		}
		return comVO;
	}
	
	@Override
	public Integer findByPrimaryKey(String comHashURL) {
		Integer comID = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery("from CompanyVO where comHashURL=:comHashURL");
			query.setParameter("comHashURL", comHashURL);
			List<CompanyVO> list = query.list();
			for (CompanyVO comVO : list) {
				comID = comVO.getComID();
			}
			session.getTransaction().commit();
		} catch(RuntimeException rex) {
			session.beginTransaction().rollback();
			throw rex;
		}
		return comID;
	}

	@Override
	public List<CompanyVO> getAll() {
		List<CompanyVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.beginTransaction().commit();
		} catch(RuntimeException rex) {
			session.beginTransaction().rollback();
			throw rex;
		}
		return list;
	}

	
	
	public static void main(String[] args) {
		CompanyDAO dao = new CompanyDAO();
		
//		// 新增  
//		CompanyVO comVO1 = new CompanyVO();
//		comVO1.setComAccount("app@com.tw");
//		comVO1.setComPwd("app123");
//		comVO1.setComName("吳11租車");
//		comVO1.setComOwner("吳11");
//		comVO1.setComAddr("台北市復興南路一段390號");
//		comVO1.setComTel("(02)1987-5632");
//		comVO1.setComFax("");
//		comVO1.setComVAT("12478965");
//		dao.insert(comVO1);
		
//		// 修改 
//		CompanyVO comVO2 = new CompanyVO();
//		comVO2.setComID(11);
//		comVO2.setComPwd("Wu123");
//		comVO2.setComName("吳1租車");
//		comVO2.setComOwner("吳1");
//		comVO2.setComAddr("台北市復興南路一段390號");
//		comVO2.setComTel("(02)1987-5632");
//		comVO2.setComFax("");
//		dao.update(comVO2);
		
//		// 修改回來 
//		CompanyVO comVO3 = new CompanyVO();
//		comVO3.setComID(1);
//		comVO3.setComPwd("kitty123");
//		comVO3.setComName("長榮租車");
//		comVO3.setComOwner("林俊宏");
//		comVO3.setComAddr("高雄市前鎮區凱旋三路115號");
//		comVO3.setComTel("0988303030");
//		comVO3.setComFax("");
//		dao.update(comVO3);
		
		
		// 單一查詢 
		CompanyVO comVO4 = dao.findByPrimaryKey(1);
		System.out.print(comVO4.getComID() + ",");
		System.out.print(comVO4.getComPwd() + ",");
		System.out.print(comVO4.getComName() + ",");
		System.out.print(comVO4.getComOwner() + ",");
		System.out.print(comVO4.getComAddr() + ",");
		System.out.print(comVO4.getComTel() + ",");
		System.out.print(comVO4.getComFax() + ",");
		System.out.println(comVO4.getComVAT());

		System.out.println("---------------------");
		
		
		// 全部查詢 
		List<CompanyVO> list = dao.getAll();
		for(CompanyVO aCom : list) {
		System.out.print(aCom.getComID() + ",");
		System.out.print(aCom.getComPwd() + ",");
		System.out.print(aCom.getComName() + ",");
		System.out.print(aCom.getComOwner() + ",");
		System.out.print(aCom.getComAddr() + ",");
		System.out.print(aCom.getComTel() + ",");
		System.out.print(aCom.getComFax() + ",");
		System.out.println(aCom.getComVAT());
		System.out.println();
		System.out.println("---------------------");
		}

		
			
			
	}
}
