package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL = "select * from student;";
    private final String INSERT_INTO = "insert into student(name,gender,point,class_id) values(?,?,?,?);";

    @Override
    public List<Student> findAll() {
        // Kết nối db để trả về 1 list
        List<Student> studentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        // tạo câu truy vấn
        try {
            PreparedStatement ps= connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                 int id = resultSet.getInt("id");
                 String name = resultSet.getString("name");
                 boolean gender = resultSet.getBoolean("gender");
                 float point = resultSet.getFloat("point");
                 int classId= resultSet.getInt("class_id");
                 Student student = new Student(id,name,gender,point,classId);
                 studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }
    @Override
    public boolean add(Student student) {
        // kết nối db sau thêmowis
        Connection connection = BaseRepository.getConnectDB();
        try {
            // set tham số
            PreparedStatement ps= connection.prepareStatement(INSERT_INTO);
            ps.setString(1,student.getName());
            ps.setBoolean(2,student.isGender());
            ps.setFloat(3,student.getPoint());
            ps.setInt(4,student.getClassId());
            // thức hiện cầu query
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Student findById(int id) {
        Student student=null;
//        for (Student s: studentList) {
//            if (s.getId()==id){
//                student= s;
//                break;
//            }
//        }
        return student;
    }



    @Override
    public boolean delete(int id) {
        return false;
    }
}
