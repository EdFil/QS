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
    createdRestaurants, restaurantNames, restaurantAddresses, restaurantVegetarian, menus, menuPrices
INVARIANT
    createdRestaurants <: RESTAURANTS &
    restaurantNames : createdRestaurants --> RESTNAMES &
    restaurantAddresses : createdRestaurants --> RESTADDRESSES &
    restaurantVegetarian : createdRestaurants --> BOOL &
    menus : createdRestaurants --> DISHES &
    menuPrices : menus --> NAT &
    // R8
    !res.(res: createdRestaurants => (card({res} <| menus) >= 5 & card({res} <| menus) <= 15))
INITIALISATION
    menuPrices := {} || menus := {} || createdRestaurants := {} || 
    restaurantNames := {} || restaurantAddresses := {} || restaurantVegetarian := {}
OPERATIONS
    result <-- checkRestaurantID(ID) =
    PRE ID : RESTAURANTS
    THEN
        result := bool(ID : createdRestaurants)
    END;
    
    result <-- dishInMenu(dishID) =
    PRE
        dishID : DISHES
    THEN
        result := bool(dishID : ran(menus))
    END;

    
    result <-- getPrice(rr, dd) =
    PRE 
        rr : RESTAURANTS & dd : DISHES
    THEN
        result := TRUE
       // result := menuPrices({rr} * {dd})
       // result := menuPrices(menus(rr))
       // result := ran(({rr} <| menus /\ menus |> {dd} ) <| menuPrices)
    END;
        
END
