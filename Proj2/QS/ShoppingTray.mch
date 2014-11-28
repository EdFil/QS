/* ShoppingTray
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    ShoppingTray
SEES
    Dish
SETS
    TRAYS; STATUS = {OPEN, CLOSED, PAID}
VARIABLES
    createdTrays, status, numberOfDishes, trayCost
INVARIANT
    createdTrays <: TRAYS &
    status : createdTrays --> STATUS &
    numberOfDishes : NAT & numberOfDishes >= 0 &
    trayCost : NAT & trayCost >= 0
INITIALISATION
    createdTrays := {} ||
    status := createdTrays * {OPEN} ||
    numberOfDishes := 0 ||
    trayCost := 0
END
