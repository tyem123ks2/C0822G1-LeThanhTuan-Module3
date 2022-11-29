import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServle", value = "/calculator")
public class DiscountServle extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {;
        //Nếu gửi dữ liệu lên bằng method post thì vào doPost
        //Lấy dữ liệu từ client gửi lên
        String product = req.getParameter("text1");
        double listPrice = Double.parseDouble(req.getParameter("num1"));
        double discountPercent = Double.parseDouble(req.getParameter("percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice * discountPercent - discountAmount;
        //Cách gửi dữ liệu sang result
        req.setAttribute("qd",discountAmount);
        req.setAttribute("ds",discountPrice);
        //Chuyển sang trang mới result.jsp
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/display.jsp");
        requestDispatcher.forward(req,resp);
    }
}
