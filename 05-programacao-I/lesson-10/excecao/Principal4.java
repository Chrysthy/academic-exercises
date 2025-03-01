
public class Principal4 {

    public static void main(String[] args) {

        try {

            int array[] = new int[3];
            array[0] = 10 / 2;
            System.out.println(array[0]);

        } catch (ArithmeticException e) {

            System.out.println("ArithmeticException => " + e.getMessage());

        } catch (ArrayIndexOutOfBoundsException e) {

            System.out.println("ArrayIndexOutOfBoundsException => " + e.getMessage());

        } catch (Exception e) {

            System.out.println("Exception => " + e.getMessage());

        } finally {

            System.out.println("Fim");
        }

    }

}
