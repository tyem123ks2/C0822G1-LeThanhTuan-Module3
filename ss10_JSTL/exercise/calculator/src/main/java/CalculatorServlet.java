import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("1st"));
        double secondOperand = Double.parseDouble(request.getParameter("2nd"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.print("<html>");
        writer.print("<h1>Result: <h1>");
            try{
                double result = Calculator.calculator(firstOperand, secondOperand, operator);
                writer.println(firstOperand + " " + operator + " " + secondOperand + " " + " = " + result);
            } catch (Exception e) {
                writer.println("Error: ");
            }
            writer.println("<html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
