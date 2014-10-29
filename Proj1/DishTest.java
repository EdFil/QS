import org.junit.Test;
import static org.junit.Assert.*;

public class DishTest {

	public static final String DEFAULT_DISH_NAME = "Meatballs";
	public static final String DEFAULT_DISH_DESCRIPTION = "Very spicy and italian";
	public static final bool DEFAULT_DISH_IS_VEGITARIAN = false;


	//Isto assim está mal porque o restaurante tem que ter no minimo 5 pratos.
	public static final String DEFAULT_RESTAURANT_NAME = "McDonalds";
	public static final String DEFAULT_RESTAURANT_ADRESS = "Food Street, after the tree";
	public static final List<Dish> DEFAULT_RESTAURANT_DISHES = new List<Dish>();
	public static final int[] DEFAULT_RESTAURANT_PRICES = {};

	@Test
	public void testDishCreation(){
		final String name = "Chicken";
		final String description = "The chicken from tagus";
		final boolean isVegetarian = false;
		Dish dish = new Dish(name, description, isVegetarian);
		//assertEquals("The dish name is not the same.", name, dish.getName());
		//assertEquals("The dish description is not the same.", description, dish.getDescription());
		//assertEquals("The dish has not the same vegetarian status.", name, dish.isVegetarian());
	}

	// --------------------------------
	// -------- dish.getName() --------
	// --------------------------------

	@Test
	public void testGetName(){
		final String name = "Rice with meat";
		Dish dish = new Dish(name, DEFAULT_DISH_DESCRIPTION, DEFAULT_DISH_IS_VEGITARIAN);
		assertEquals("The dish name is not the same.", name, dish.getName());
	}

	@Test
	public void testGetNameWithNull(){
		final String name = null;
		Dish dish = new Dish(name, DEFAULT_DISH_DESCRIPTION, DEFAULT_DISH_IS_VEGITARIAN);
		assertEquals("The dish name is not the same.", name, dish.getName());
	}

	// --------------------------------------
	// -------- dish.setRestaurant() --------
	// --------------------------------------

	@Test
	public void testSetRestaurant(){
		Restaurant restaurant = new Restaurant(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, DEFAULT_RESTAURANT_DISHES, DEFAULT_RESTAURANT_PRICES);
		Dish dish = new Dish(DEFAULT_DISH_NAME, DEFAULT_DISH_DESCRIPTION, DEFAULT_DISH_IS_VEGITARIAN);
		dish.setRestaurant(newRestaurant);
		assertEquals("The new Restaurant was not set", newRestaurant, dish.getRestaurant());
	}

	@Test
	public void testSetRestaurantToNull(){
		Restaurant newRestaurant = null;
		Dish dish = new Dish(DEFAULT_DISH_NAME, DEFAULT_DISH_DESCRIPTION, DEFAULT_DISH_IS_VEGITARIAN);
		dish.setRestaurant(newRestaurant);
		assertEquals("The new Restaurant was not set", newRestaurant, dish.getRestaurant());
	}

	// ---------------------------------------
	// -------- dish.getDescription() --------
	// ---------------------------------------

	@Test
	public void testGetDescription(){
		final String description = "It's good but expensive";
		Dish dish = new Dish(DEFAULT_DISH_NAME, description, DEFAULT_DISH_IS_VEGITARIAN);
		assertEquals("The description is not the same", description, dish.getDescription());
	}

	@Test
	public void testGetDescriptionWithNull(){
		final String description = null;
		Dish dish = new Dish(DEFAULT_DISH_NAME, description, DEFAULT_DISH_IS_VEGITARIAN);
		assertEquals("The description is not the same", description, dish.getDescription());
	}

	// -------------------------------------
	// -------- dish.isVegetarian() --------
	// -------------------------------------

	@Test
	public void testIsVegetarianTrue(){
		final boolean isVegetarian = true;
		Dish dish = new Dish(DEFAULT_DISH_NAME, DEFAULT_DISH_DESCRIPTION, isVegetarian);
		assertTrue("This dish should be vegetarian.", dish.isVegetarian());
	}

	@Test
	public void testIsVegetarianFalse(){
		final boolean isVegetarian = false;
		Dish dish = new Dish(DEFAULT_DISH_NAME, DEFAULT_DISH_DESCRIPTION, isVegetarian);
		assertTrue("This dish should not be vegetarian.", dish.isVegetarian());
	}

}











public class Dish {
	//creates a dish with a given name and description 
	public Dish(String name, String description, boolean isVegetarian) { /* .... */ }
	//returns the name of this dish public 
	String getName() { /* .... */ }
	//sets the Restaurant of this dish 
	public void setRestaurant(Restaurant r) { /* .... */ }
	//returns the Restaurant of this dish 
	public Restaurant getRestaurant() { /* .... */ }
	//returns the description of this dish public 
	String getDescription() { /* .... */ }
	//checks if this dish is vegetarian 
	public boolean isVegetarian() { /* .... */ }
}