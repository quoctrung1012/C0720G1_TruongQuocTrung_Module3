package dao;

import models.Customers;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    static List<Customers> listCustomer;
    static {
        listCustomer = new ArrayList<>();
        listCustomer.add(new Customers("Mai Văn Hoàn","1983-08-20","Hà Nội", "image/male.jpg"));
        listCustomer.add(new Customers("Nguyễn Văn Nam","1983-08-21","Bắc Giang", "image/male.jpg"));
        listCustomer.add(new Customers("Nguyễn Thái Hòa","1983-08-22","Nam Định", "image/male.jpg"));
        listCustomer.add(new Customers("Trần Đăng Khoa","1983-08-17","Hà Tây", "image/male.jpg"));
        listCustomer.add(new Customers("Nguyễn Đình Thi","1983-08-19","Hà Nội", "image/male.jpg"));
    }
    public static List<Customers> readAllCustomer(){
        return listCustomer;
    }
}
