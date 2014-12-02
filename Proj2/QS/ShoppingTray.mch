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
    createdTrays, status, numberOfDishes, trayCost, createdClients, clientTrays, dishes, trayDishes
INVARIANT
    dishes <: DISHES &
    createdClients <: CLIENTS &
    createdTrays <: TRAYS &
    clientTrays : createdTrays --> createdClients & 
    trayDishes : createdTrays --> dishes &
    status : createdTrays --> STATUS &
    numberOfDishes : NAT & numberOfDishes >= 0 &
    trayCost : NAT &
    trayCost >= 0
INITIALISATION
    dishes := {} ||
    trayDishes := {} ||
    createdClients := {} ||
    createdTrays := {} ||
    clientTrays := {} ||
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
    
    registerTray(cc, tt) =
    PRE cc : CLIENTS & tt : TRAYS & ran(clientTrays) = ran(clientTrays |> {cc}) 
    THEN
        cc :: createdClients ||
        tt :: createdTrays ||
        clientTrays(tt) := cc
    END;
    
    addDish(tr, dd) =
    PRE tr : TRAYS & dd : DISHES
    THEN
        trayDishes := trayDishes \/ {tr |-> dd}
    END;
END
