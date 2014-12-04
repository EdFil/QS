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
    trayDishes : createdTrays --> {dishes} &
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
    
    
    newDishInTray(dd) = 
    PRE dd : DISHES & dd /: dishes
    THEN
        dd :: dishes
    END;
       
   
    newTray(cc) =
    PRE cc : CLIENTS //Se cada client só puder ter uma tray OPEN, falta fazer essa verificação
    THEN
        ANY tt
        WHERE
            tt : TRAYS &
            tt /: createdTrays
        THEN
            IF bool(cc : createdClients) = FALSE
            THEN
                cc :: createdClients
            ELSE skip
            END ||
            createdTrays := createdTrays \/ {tt} ||
            clientTrays(tt) := cc
        END
    END;
    
    
    addDishToTray(tr, dd) =
    PRE tr : createdTrays & dd : dishes & dd /: trayDishes(tr) & status(tr) = OPEN 
    THEN
        trayDishes(tr) := trayDishes(tr) \/ {dd}
    END;
    
    
    removeDishFromTray(tr, dd) =
    PRE tr : createdTrays & dd : trayDishes(tr) & status(tr) = OPEN
    THEN 
        trayDishes(tr) := trayDishes(tr) - {dd}
    END;

    
    checkoutTray(tr) =
    PRE tr : createdTrays & status(tr) = OPEN
    THEN
        status(tr) := CLOSED
    END;
    
    
    cancelTray(tr) =
    PRE tr : createdTrays & status(tr) /= PAID
    THEN
        trayDishes(tr) := {} ||
        clientTrays := {tr} <<| clientTrays ||
        createdTrays := createdTrays - {tr}
    END;
    
END
