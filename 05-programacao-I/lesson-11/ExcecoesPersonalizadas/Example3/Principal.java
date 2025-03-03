
public class Principal {

	public static void main(String[] args) {

		try {

			int array[] = new int[3];
			array[0] = 10 / 2;
			System.out.println(array[0]);

		} catch (ArithmeticException e) {

			System.out.println("ArithmeticExceptionCustom: " + e.getMessage());

		} catch (ArrayIndexOutOfBoundsExceptionCustom e) {
			System.out.println("ArrayIndexOutOfBoundsException " + e.getMessage());

		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());

		} finally {
			System.out.println("Fim");
		}

	}

}

