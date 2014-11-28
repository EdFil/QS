/* Dish
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Dish
SETS
    DISHES; DESCRIPTIONS; NAMES; DISHTYPES = {VEG, NVEG}
VARIABLES
    createdDishes, dishNames, dishDescriptions, dishVegetarian
INVARIANT
    createdDishes <: DISHES &
    dishNames : createdDishes --> NAMES &
    dishDescriptions : createdDishes --> DESCRIPTIONS &
    dishVegetarian : createdDishes --> DISHTYPES
INITIALISATION
    createdDishes := {} || dishNames := {} || dishDescriptions := {} || dishVegetarian := {}
OPERATIONS
    registerDish(name, desc, isVeg, dishId) =
    PRE
        name : NAMES &
        desc : DESCRIPTIONS &
        isVeg : DISHTYPES &
        dishId <: DISHES &
        dishId /: createdDishes
    THEN
        createdDishes := createdDishes \/ dishId ||
        dishNames(dishId) := name ||
        dishDescriptions(dishId) := desc ||
        dishVegetarian(dishId) := isVeg
    END;
  
END