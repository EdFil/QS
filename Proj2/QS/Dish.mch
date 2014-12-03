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
    newDish(name, desc, isVeg) = 
    PRE name : NAMES & desc : DESCRIPTIONS & isVeg : BOOL
    THEN
        ANY dd
        WHERE
            dd : DISHES & 
            dd /: createdDishes
        THEN
            createdDishes := createdDishes \/ {dd} ||
            dishNames(dd) := name ||
            dishDescriptions(dd) := desc ||
            dishVegetarian(dd) := isVeg
        END
    END;
    
    deleteDish(dd) =
    PRE
        dd : createdDishes
    THEN
        createdDishes := createdDishes - {dd}
    END;

    name <-- getDishName(dd) =
    PRE
        dd : createdDishes
    THEN
        name := dishNames(dd)
    END;
    
    desc <-- getDishDescription(dd) =
    PRE dd : createdDishes
    THEN
        desc := dishDescriptions(dd)
    END;

    bb <--isVegetarianDish(dd) =
    PRE dd : createdDishes
    THEN
        bb := dishVegetarian(dd)
    END;
END