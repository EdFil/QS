/* Dish
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Dish
SETS
    DISHES; DESCRIPTIONS; NAMES
VARIABLES
    createdDishes, dishNames, dishDescriptions, dishVegetarian
INVARIANT
    createdDishes <: DISHES &
    dishNames : createdDishes --> NAMES &
    dishDescriptions : createdDishes --> DESCRIPTIONS &
    dishVegetarian : createdDishes --> BOOL
INITIALISATION
    createdDishes := {} || dishNames := {} || dishDescriptions := {} || dishVegetarian := {}
OPERATIONS
    result <-- checkDishID(ID) =
    PRE ID : DISHES
    THEN
        result := bool(ID : createdDishes)
    END;
    
    registerDish(name, desc, isVeg, dishId) =
    PRE
        name : NAMES &
        desc : DESCRIPTIONS &
        isVeg : BOOL &
        dishId <: DISHES &
        dishId /\ createdDishes = {}
    THEN
        createdDishes := createdDishes \/ dishId ||
        dishNames(dishId) := name ||
        dishDescriptions(dishId) := desc ||
        dishVegetarian(dishId) := isVeg
    END;
    
    
  
END