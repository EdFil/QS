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
    dishNames : createdDishes >-> NAMES &
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
    
    registerDish(name, desc, isVeg, dishID) =
    PRE
        name : NAMES &
        desc : DESCRIPTIONS &
        isVeg : BOOL &
        dishID : DISHES &
        dishID /: createdDishes
    THEN
        dishID :: createdDishes ||
        //createdDishes := createdDishes \/ {dishID} ||
        dishNames(dishID) := name ||
        dishDescriptions(dishID) := desc ||
        dishVegetarian(dishID) := isVeg
    END;
  
END