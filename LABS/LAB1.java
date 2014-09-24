import org.junit.Test;
import static org.junit.Assert.*;

public class LAB1 {

	@Test
	public void testaAddZeroComNegativo(){
		final int INITIAL_VALUE = -5;
		MyInteger integer = new MyInteger(INITIAL_VALUE);

		integer.add(0);

		assertEquals("Valor absoluto errado.", Math.abs(INITIAL_VALUE), integer.getAbsoluteValue());
		assertFalse("Valor deixou de ser negativo", integer.isPositive());
		assertEquals("Valor não é o maior", INITIAL_VALUE, integer.getBiggest());
	}

	@Test
	public void testaAddZeroComPositivo(){
		final int INITIAL_VALUE = 5;
		MyInteger integer = new MyInteger(INITIAL_VALUE);

		integer.add(0);

		assertEquals("Cenas", Math.abs(INITIAL_VALUE), integer.getAbsoluteValue());
		assertTrue("Cenas", integer.isPositive());
		assertEquals("", INITIAL_VALUE, integer.getBiggest());
	}

	@Test
	public void testBiggest1(){
		final int INITIAL_VALUE = 1;
		final int VALUE_TO_ADD  = 2;
		MyInteger integer = new MyInteger(INITIAL_VALUE);
		final int prevBiggest = integer.getBiggest();

		integer.add(VALUE_TO_ADD);

		assertEquals("", INITIAL_VALUE + VALUE_TO_ADD, integer.getAbsoluteValue());
		//assertTrue("", (INITIAL_VALUE + VALUE_TO_ADD) > prevBiggest);
		assertEquals("", INITIAL_VALUE + VALUE_TO_ADD, integer.getBiggest());
		assertTrue("Cenas", integer.isPositive());
	}

	@Test
	public void testBiggest2(){
		final int INITIAL_VALUE = 5;
		final int VALUE_TO_ADD  = 1;
		MyInteger integer = new MyInteger(INITIAL_VALUE);

		integer.add(-3); //2
		integer.add(VALUE_TO_ADD) // 3

		assertEquals("", INITIAL_VALUE + VALUE_TO_ADD + -3, integer.getAbsoluteValue());
		assertNotEquals("", integer.getAbsoluteValue(), integer.getBiggest());
		assertTrue("Cenas", integer.isPositive());
	}

}