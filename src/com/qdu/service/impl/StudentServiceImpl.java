package com.qdu.service.impl;

import com.qdu.dao.StudentDao;
import com.qdu.entity.Student;
import com.qdu.service.StudentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Anna
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student getStudentById(String id) {
        return studentDao.getOneById(id);
    }

    @Override
    public List getStudentList() {
        return studentDao.getAll();
    }

    @Override
    public List getStudentListByBatchName(String batchName) {
        return studentDao.getListByBatchName(batchName);
    }

    @Override
    public void addStudent(Student student) {
        studentDao.insert(student);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.update(student);
    }

    @Override
    public void deleteStudent(String id) {
        studentDao.deleteById(id);
    }

    @Override
    public List getListByPageNumberAndSize(int pageNumber, int pageSize) {
        return studentDao.getListByPageNumberAndSize(pageNumber, pageSize);
    }

}
