package com.qdu.service;

import com.qdu.entity.Student;


import java.util.List;

public interface StudentService {

    /**
     * 根据学号获取一个学生的所有信息
     *
     * @param id 字符串表示的学号
     * @return 一个Student对象，包含学生信息
     */
    Student getStudentById(String id);

    /**
     * 获取所有学生的列表
     *
     * @return 一个列表，包含所有学生的信息
     */
    List getStudentList();

    /**
     * 获取所有学生的列表
     *
     * @param batchName 字符串表示的班级名称
     * @return 一个列表，包含该班级所有学生的信息
     */
    List getStudentListByBatchName(String batchName);

    /**
     * 添加一个新学生
     *
     * @param student 一个包含新学生信息的Student对象
     */
    void addStudent(Student student);

    /**
     * 更新一个新学生
     *
     * @param student 一个包含新学生信息的Student对象
     */
    void updateStudent(Student student);

    /**
     * 根据学号删除一个学生
     *
     * @param id 字符串表示的学号
     */
    void deleteStudent(String id);


    /**
     * 根据页码和页面记录大小获取指定页的记录
     *
     * @param pageNumber
     * @param pageSize
     * @return 一个列表，列表中包含本页应该显示的所有学生
     */
    List getListByPageNumberAndSize(int pageNumber, int pageSize);
}
