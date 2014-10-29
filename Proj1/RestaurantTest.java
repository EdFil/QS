import org.junit.Test;
import static org.junit.Assert.*;

public class RestaurantTest {

	public static final String DEFAULT_RESTAURANT_NAME = "McDonalds";
	public static final String DEFAULT_RESTAURANT_ADRESS = "Rua da comida, 4º Esquerdo";
	public static final List<Dish> DEFAULT_RESTAURANT_DISHES = new List<Dish>();
	public static final int[] DEFAULT_DISH_PRICES = {};

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