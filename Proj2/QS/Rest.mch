/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
INCLUDES
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

END
