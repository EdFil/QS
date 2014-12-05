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
    createdTrays, status, trayCost, createdClients, clientTrays, dishes, trayDishes
INVARIANT
    dishes <: DISHES &
    createdClients <: CLIENTS &
    createdTrays <: TRAYS &
    clientTrays : createdTrays --> createdClients & 
    trayDishes : createdTrays +-> {dishes} &
    status : createdTrays --> STATUS &
    trayCost : createdTrays +-> NAT  
INITIALISATION
    dishes := {} ||
    trayDishes := {} ||
    createdClients := {} ||
    createdTrays := {} ||
    clientTrays := {} ||
    status := {} ||
    trayCost := {}
OPERATIONS          
    newTray(cc) =
    PRE cc : CLIENTS //Se cada client só puder ter uma tray OPEN, falta fazer essa verificação
    THEN
        ANY tt
        WHERE
            tt : TRAYS &
            tt /: createdTrays
        THEN
            IF 
                bool(cc : createdClients) = FALSE
            THEN
                createdClients := createdClients \/ {cc}
            END ||
            createdTrays := createdTrays \/ {tt} ||
            status(tt) := OPEN ||
            clientTrays(tt) := cc
        END
    END;
    
    newDishInTray(dd) =
    PRE dd : createdDishes & dd /: dishes
    THEN
        dishes := dishes \/ {dd}
    END;

    addDishToTray2(tr, dd) =
    PRE 
        tr : createdTrays & 
        dd : dishes &
        dd /: trayDishes(tr) &
        status(tr) = OPEN 
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
    
    payTray2(tr,pp) =
    PRE tr : createdTrays & pp : NAT
    THEN
        trayDishes := {tr} <<| trayDishes ||
        status(tr) := PAID ||
        trayCost(tr) := pp 
    END
    
END