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
	public void testCase1(){
		List<Dish> dishList = Arrays.asList(NORM_1, NORM_2, NORM_3, NORM_4, NORM_5);
		int[] dishPrices = new int[] { 10, 20, 30 ,40, 50 };
		Restaurant vegiRestaurant = new Restaurante(DEFAULT_RESTAURANT_NAME, DEFAULT_RESTAURANT_ADRESS, dishList, dishPrices);

	}

	@Test
	public void testSetVegetarianToTrueWithMultipleDishTypes(){
		Restaurant notVegiOnlyRestaurant = new Restaurante();
		vegiRestaurant.setVegetarian(true);
		thrown.expected(InvalidInvocationException.class);
		assertFalse("Restaurant is vegetarian and has other types of food", vegiRestaurant.isVegetarian());
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
	public int getprice(Dish dish) { /* .... */ }
	//returns the list of dishes of this restaurant 
	public List<Dish> getDishes() { /* .... */ }
}