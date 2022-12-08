package controller.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                showForm(request, response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerTypeList", customerTypeService.findAllCustomerType());
        try {
            request.getRequestDispatcher("/view/customer/update.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = this.customerService.selectAll();
        List<CustomerType> typeList = this.customerService.selectType();
        request.setAttribute("list",list);
        request.setAttribute("typeList",typeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "find":
                find(request, response);
                break;
            case "edit":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.customerService.delete(id);
        showList(request,response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idType = Integer.parseInt(request.getParameter("typeid"));
        CustomerType customerType = new CustomerType(idType);
        Customer customer = new Customer(id,name,birthDay,gender,idCard,phoneNumber,email,address,customerType);
        this.customerService.updateCustomer(customer);
        showList(request,response);
    }

    private void find(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idType = Integer.parseInt(request.getParameter("typeid"));
        CustomerType customerType = new CustomerType(idType);
        Customer customer = new Customer(id, name, birthDay, gender, idCard, phoneNumber, email, address, customerType);
        this.customerService.updateCustomer(customer);
        showList(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String date = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("typeid"));
        CustomerType customerType = new CustomerType(typeId);
        Customer customer = new Customer(name, date, gender, idCard, phoneNumber, email, address, customerType);
        this.customerService.insertCustomer(customer);
        showList(request, response);

    }
}