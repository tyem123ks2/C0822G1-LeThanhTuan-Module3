public class Calculator {
    public static double calculator(double firstOperand, double secondOperang, char operator) {
        switch (operator) {
            case '+':
                return firstOperand + secondOperang;
            case '-':
                return firstOperand - secondOperang;
            case '*':
                return firstOperand * secondOperang;
            case '/':
                if (secondOperang != 0)
                    return firstOperand / secondOperang;
                else
                    throw new RuntimeException("Không thể chia cho số 0");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
