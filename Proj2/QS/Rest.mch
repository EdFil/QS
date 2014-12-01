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
        dd : DISHES & dishNotInMenu(dd) = TRUE
    THEN
        deleteDish(dd)
    END;  
END
