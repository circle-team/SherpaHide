package com.qdu.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 实体类Student，和Student表对应，后续通过操作Student对象操作Student表
 * <br>和表映射的实体类一般遵循以下规范
 * <br>1) 实现Serializable接口
 * <br>2) 属性私有化，设置getter和setter，如果属性是可以接受null值的，尽量使用封装器类型
 * <br>3) 保留一个不带参数的构造函数，其他构造函数根据需要生成即可
 *
 * @author NIIT
 */
@Entity
public class Student implements Serializable {

    @Id
    private String srollno;
    private String sname;
    private String spassword;
    private String sgender;
    private String sbatch;
    
    public Student() {
    }

    public Student(String srollno) {
        this.srollno = srollno;
    }
    
    //一旦自己定义了构造函数，则自带的没了
    public Student(String srollno, String sname, String spassword, String sgender, String sbatch) {
        this.srollno = srollno;
        this.sname = sname;
        this.spassword = spassword;
        this.sgender = sgender;
        this.sbatch = sbatch;
    }
    
    public String getSrollno() {
        return srollno;
    }

    public void setSrollno(String srollno) {
        this.srollno = srollno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public String getSgender() {
        return sgender;
    }

    public void setSgender(String sgender) {
        this.sgender = sgender;
    }

    public String getSbatch() {
        return sbatch;
    }

    public void setSbatch(String sbatch) {
        this.sbatch = sbatch;
    }
}
