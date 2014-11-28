/* Dish
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Dish
SETS
    DISHES; DESCRIPTIONS; NAMES
VARIABLES
    createdDishes, dishNames, dishDescriptions
INVARIANT
    createdDishes <: DISHES &
    dishNames : createdDishes --> NAMES &
    dishDescriptions : createdDishes --> DESCRIPTIONS
INITIALISATION
    createdDishes := {} || dishNames := {} || dishDescriptions := {}
END
