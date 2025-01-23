
public class Exercise05 {

	public static void main(String[] args) {
		
		int num1, num2;
		
		num1 = 6;
		num2 = 6;
		
		System.out.println(num1); //6
		System.out.println(num2); //6
		
		//num1++; //num1 = num1 + 1;
		//++num2; //num2 = num2 + 1;
		
		//pós-fixado: primeiro printa e só no próximo que incrementa
		//System.out.println(num1++);
		System.out.println(num1); //6
		num1++;
		System.out.println(num1); //7
		
		
		//pré-fixado: incrementa primeiro e depois printa 
		//System.out.println(++num2);
		num2++;
		System.out.println(num2); //7
		
		System.out.println(++num1 - num2++);
		//8 - 7
		
	}

}
