package example2;

/*
 * Special thanks to
 * http://users.csc.calpoly.edu/~djanzen/tdl/tddintro/helloworld/
 * for getting us started.
 */

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class Tests
{

	private Snippet h;

	@Before
	public void setUp() throws Exception
	{
		h = new Snippet();
	}

	@Test
	public void testHelloEmpty()
	{
		assertEquals(h.concatenate("He","llo"),"Hello");
	}

}
