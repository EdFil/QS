/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
INCLUDES
    Restaurant,Dish,ShoppingTray
CONSTANTS
    maxPrice
PROPERTIES
    maxPrice : NAT
OPERATIONS
    newDish(name, desc, isVeg) = 
    PRE name : NAMES & desc : DESCRIPTIONS & isVeg : DISHTYPES
    THEN
        ANY dish
        WHERE
            dish : DISHES & dish /: createdDishes
        THEN
            registerDish(name, desc, isVeg, dish)
        END
    END;


END
