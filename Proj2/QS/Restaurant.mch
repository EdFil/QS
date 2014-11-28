/* Restaurant
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Restaurant
SEES
    Dish
SETS
    RESTAURANTS; RESTNAMES; RESTADDRESSES     
VARIABLES
    createdRestaurants, restaurantNames, restaurantAddresses, menu
INVARIANT
    createdRestaurants <: RESTAURANTS &
    restaurantNames : createdRestaurants --> RESTNAMES &
    restaurantAddresses : createdRestaurants --> RESTADDRESSES &
    menu : DISHES --> NAT1 & card(menu) >= 5 & card(menu) <= 15
INITIALISATION
    menu := {} || createdRestaurants := {} || 
    restaurantNames := {} || restaurantAddresses := {}
END
