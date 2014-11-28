/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
SEES
    Restaurant,
    Dish,
    ShoppingTray
SETS
    DISHES; RESTAURANTS; TRAYS; CLIENTS
VARIABLES
    dishes, restaurants, trays, clients
INVARIANT
    dishes <: DISHES &
    restaurants <: RESTAURANTS &
    trays <: TRAYS &
    clients <: CLIENTS
INITIALISATION
    dishes := {} || restaurants := {} || trays := {} || clients := {}
OPERATIONS
    newDish(name, desc, isVegi) =
    PRE isVegi : BOOL & name : NAMES & desc : DESCRIPTIONS
    THEN dishes := dishes \/ { name, desc, isVegi }
    END;

END
