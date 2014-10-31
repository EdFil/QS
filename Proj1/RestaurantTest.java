import org.junit.Test;
import static org.junit.Assert.*;

public class RestaurantTest {

	public static final Dish VEGI_1 = new Dish("Vegi_1", "Desc_1", true);
	public static final Dish VEGI_2 = new Dish("Vegi_2", "Desc_2", true);
	public static final Dish VEGI_3 = new Dish("Vegi_3", "Desc_3", true);
	public static final Dish VEGI_4 = new Dish("Vegi_4", "Desc_4", true);
	public static final Dish VEGI_5 = new Dish("Vegi_5", "Desc_5", true);

	public static final Dish NORM_1 = new Dish("Norm_1", "Desc_1", false);
	public static final Dish NORM_2 = new Dish("Norm_2", "Desc_2", false);
	public static final Dish NORM_3 = new Dish("Norm_3", "Desc_3", false);
	public static final Dish NORM_4 = new Dish("Norm_4", "Desc_4", false);
	public static final Dish NORM_5 = new Dish("Norm_5", "Desc_5", false);

	public static final String DEFAULT_RESTAURANT_NAME = "McDonalds";
	public static final String DEFAULT_RESTAURANT_ADRESS = "Food Street, after the tree";

	@Test
	public void testCase1TestingWithValidData(){
		List<Dish> dishList = Arrays.asList(NORM_1, NORM_2, NORM_3, NORM_4, NORM_5);
		int[] dishPrices = new int[] { 22, 20, 30 ,40, 50 };
		Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
		assertEquals("Restaurant name is not OK", DEFAULT_RESTAURANT_NAME, restaurant.getName());
		assertEquals("Restaurant address is not OK", DEFAULT_RESTAURANT_ADRESS, restaurant.getAdress());
		assertEquals("Restaurant should not be Vegetarian by default", false, restaurant.isVegetarian());
		for(int i = 0; i < dishList.size; i++){
			assertEquals("Dish " + i + " is not OK", dishList.get(i), restaurant.getDishes().getDish(i));
			assertEquals("Price " + i + " is not OK", dishPrices.get(i), getPrice(dishList.get(i)));
		}
	}

	@Test
	public void testCase2TestingNotEnoughtDishes(){
		List<Dish> dishList = Arrays.asList(NORM_1, NORM_2, NORM_3, NORM_4);
		int[] dishPrices = new int[] { 21, 19, 30 , 29 };
		try{
			Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
			fail("Restaurant should not have been created");
		}catch(InvalidInvocationException e) {}
	}

	@Test
	public void testCase5TestingOneFreePrice(){
		List<Dish> dishList = Arrays.asList(NORM_1, NORM_2, NORM_3, NORM_4, NORM_5, VEGI_1, VEGI_2);
		int[] dishPrices = new int[] { 10, 12, 132, 53, 32, 1, 34 };
		Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
		restaurant.addDish(NORM_2, 0);
		for(int i = 0; i < dishList.size; i++){
			assertEquals("Price " + i + " is not OK", dishPrices.get(i), getPrice(dishList.get(i)));
			assertEquals("Dish " + i + " is not OK", dishList.get(i), restaurant.getDishes().getDish(i));
		}
		assertEquals("Restaurant should not be Vegetarian by default", false, restaurant.isVegetarian());
		assertEquals("Restaurant address is not OK", DEFAULT_RESTAURANT_ADRESS, restaurant.getAdress());
		assertEquals("Restaurant name is not OK", DEFAULT_RESTAURANT_NAME, restaurant.getName());
	}

	@Test
	public void testCase10TestingNotEnoughPricesForDishes(){
		List<Dish> dishList = Arrays.asList(NORM_1, NORM_2, NORM_3, NORM_4, NORM_5, VEGI_1);
		int[] dishPrices = new int[] { 10, 12, 132, 53, 32 };
		try{
			Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
		}catch(InvalidInvocationException e) {}
	}

	@Test
	public void testCase13TestingSettingVegitarianWithNonVegitarianFood(){
		List<Dish> dishList = Arrays.asList(VEGI_1, VEGI_2, VEGI_3, VEGI_4, VEGI_5, NORM_1, NORM_2);
		int[] dishPrices = new int[] { 21, 10, 0, 14, 21, 92, 18 };
		Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
		try {
			restaurant.setVegetarian(true);
			fail("Cannot have a vegetaria restaurant with non vegetarian food");
		} catch(InvalidInvocationException e) {
			assertFalse("Restaurant should not have changed to vegitarian", restaurant.isVegetarian());
		}
	}

	@Test
	public void testCase15TestingHavingNonUniqueDishNames(){
		Dish dish = new Dish("Name1", "Desc1", true);
		Dish dish2 = new Dish("Name1", "Desc2", false);
		List<Dish> dishList = Arrays.asList(VEGI_1, VEGI_2, VEGI_3, VEGI_4);
		int[] dishPrices = new int[] { 21, 10, 0, 14 };
		Restaurant restaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);
		restaurant.addDish(dish, 10);
		try {
			restaurant.addDish(dish2, 123);
			fail("Cannot have 2 dishes with the same name");
		} catch(InvalidInvocationException e) {
			assertFalse("Restaurant should not have changed to vegitarian", restaurant.isVegetarian());
			assertTrue("Dish should have not been removed", restaurant.getDishes().contains(dish));
			assertFalse("Cannot have 2 dishes with the same name", restaurant.getDishes().contains(dish2));
		}
	}	

}

public class Restaurant {
	//creates a restaunrant with the given name, address, initial set of //dishes and respective prices. By default the restaurant is not vegetarian 
	public Restaurant(String name, String address, List<Dish> dishes, int[] dishPrices) { /* .... */ }
	//changes the type of this restaurant 
	public void setVegetarian(boolean vegetarian) { /* .... */ }
	//checks the type of this restaurant 
	public boolean isVegetarian() { /* .... */ }
	//returns the name of this restaurant 
	public String getName() { /* .... */ }
	//returns the address of this restaurant 
	public String getAddress() { /* .... */ }
	//adds a dish with the given price to this restaurant. If the dish is already present //in the restaurant, then it just updates the price asociated with the restaurant. 
	public void addDish(Dish d, int price) { /* .... */ }
	//changes price of the dish //throws DishNotFoundException if dish does not exist in this restaurant. 
	public void changePrice(Dish d, int newPrice) { /* .... */ }
	//removes the dish from this restaurant //throws DishNotFoundException if dish does not exist in this restaurant 
	public void remove(Dish dish) { /* .... */ }
	//returns the price of the dish in this restaurant //throws DishNotFoundException if dish does not exist in this restaurant 
	public int getPrice(Dish dish) { /* .... */ }
	//returns the list of dishes of this restaurant 
	public List<Dish> getDishes() { /* .... */ }
}