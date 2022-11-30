import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Reyna", "10-11-1998", "Mexico", "https://i.pinimg.com/originals/15/4d/c1/154dc16d953e5f7e5c8f49f854c428f7.jpg"));
        customerList.add(new Customer("Killjoy", "25-01-1997", "Germany", "https://preview.redd.it/sceyds2tap761.jpg?width=960&format=pjpg&auto=webp&s=ff820bd90cdd788e135567d007e5b096bf863d22"));
        customerList.add(new Customer("Jett", "07-12-1978", "Korea", "https://cdnb.artstation.com/p/assets/images/images/030/891/733/large/iris-chu-v2-final-w-watermark.jpg?1601978385"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
