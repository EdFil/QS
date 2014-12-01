/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
INCLUDES
    Restaurant, Dish, ShoppingTray
CONSTANTS
    maxPrice
PROPERTIES
    maxPrice : NAT
OPERATIONS
    newDish(name, desc, isVeg) = 
    PRE name : NAMES & desc : DESCRIPTIONS & isVeg : BOOL
    THEN
        ANY dish
        WHERE
            dish : DISHES & 
            checkDishID(dish) = FALSE & 
            checkRestaurantID(dish) = FALSE &
            checkTrayID(dish) = FALSE &
            checkClientID(dish) = FALSE
        THEN
            registerDish(name, desc, isVeg, dish)
        END
    END;
    

    removeDish(dd) =
    PRE 
        dd : DISHES & dishInMenu(dd) = FALSE
    THEN
        deleteDish(dd)
    END; 
 

    name <-- getDishName(dd) =
    PRE dd : DISHES
    THEN
        name := dishNames(dd) 
    END;

    
    desc <-- getDishDescription(dd) =
    PRE dd : DISHES
    THEN
        desc := dishDescriptions(dd)
    END;


    bb <--isVegetarianDish(dd) =
    PRE dd : DISHES
    THEN
        bb := dishVegetarian(dd)
    END;

    
    name <-- getRestaurantName(rr) =
    PRE rr : RESTAURANTS
    THEN
        name := restaurantNames(rr)
    END;

    
    addr <-- getRestaurantAddress(rr) =
    PRE rr : RESTAURANTS
    THEN
        addr := restaurantAddresses(rr)
    END;

    
    res <-- isVegetarian(rr) =
    PRE rr : RESTAURANTS
    THEN
        res := restaurantVegetarian(rr) 
    END;          

END
