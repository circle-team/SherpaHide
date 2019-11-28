package com.qdu.dao.impl;

import com.qdu.dao.StudentDao;
import com.qdu.entity.Student;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 创建一个StudentDao接口的实现类StudentDaoImpl
 *
 * @author NIIT
 */
@Repository
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void insert(Student student) {
        //openSession() 每次开启一个新会话,必须自己手动去关闭会话
        //getCurrentSession() 每次获取当前会话，如果已经有一个会话可用，直接获取该会话使用
        //如果没有会话可用，才会创建一个新的会话，会话不需要手动关闭
        //getCurrentSession()获取的会话会和当前线程进行绑定，由线程管理会话的开始和结束
        //每次随着事务的提交或当前线程的技术，会话会被自动关闭
        sessionFactory.getCurrentSession().save(student);
    }

    @Override
    public void update(Student student) {
        sessionFactory.getCurrentSession().update(student);
    }

    @Override
    public void deleteById(String id) {
        //这里是先根据主键查询到一个对象，然后将其删除
        Student s=sessionFactory.getCurrentSession().load(Student.class, id);
        sessionFactory.getCurrentSession().delete(s);
    }

    @Override
    public Student getOneById(String id) {
        return sessionFactory.getCurrentSession().get(Student.class, id);
    }

    @Override
    public List<Student> getAll() {
        return sessionFactory.getCurrentSession().createQuery("from Student").list();
    }

    @Override
    public List<Student> getListByBatchName(String batchName) {
        //可以持续加点，对获取的对象进行操作
        return sessionFactory.getCurrentSession().createQuery("from Student where sbatch=:batch")
                .setParameter("batch", batchName)
                .list();
    }

    @Override
    public List<Student> getListByPageNumberAndSize(int pageNumber, int pageSize) {
        
        return sessionFactory.getCurrentSession().createQuery("from Student")
                .setFirstResult((pageNumber-1)*pageSize)
                .setMaxResults(pageSize)
                .list();
        
    }
}
