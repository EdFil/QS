/* ShoppingTray
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    ShoppingTray
SEES
    Dish
SETS
    TRAYS; CLIENTS; STATUS = {OPEN, CLOSED, PAID}
VARIABLES
    createdTrays, status, numberOfDishes, trayCost, createdClients
INVARIANT
    createdClients <: CLIENTS &
    createdTrays <: TRAYS &
    status : createdTrays --> STATUS &
    numberOfDishes : NAT & numberOfDishes >= 0 &
    trayCost : NAT &
    trayCost >= 0
INITIALISATION
    createdClients := {} ||
    createdTrays := {} ||
    status := createdTrays * {OPEN} ||
    numberOfDishes := 0 ||
    trayCost := 0
OPERATIONS
    result <-- checkTrayID(ID) =
    PRE ID : TRAYS
    THEN
        result := bool(ID : createdTrays)
    END;
    
    result <-- checkClientID(ID) =
    PRE ID : CLIENTS
    THEN
        result := bool(ID : createdClients)
    END;
END
