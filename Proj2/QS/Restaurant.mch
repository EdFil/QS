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
    createdRestaurants, restaurantNames, restaurantAddresses, 
    restaurantVegetarian, menus, dishPrices
INVARIANT
    createdRestaurants <: RESTAURANTS &
    restaurantNames : createdRestaurants --> RESTNAMES &
    restaurantAddresses : createdRestaurants --> RESTADDRESSES &
    restaurantVegetarian : createdRestaurants --> BOOL &
    dishPrices : DISHES --> NAT &
    menus : createdRestaurants <-> {dishPrices} &
    // R8
    !res.(res: createdRestaurants => (card({res} <| menus) >= 5 & card({res} <| menus) <= 15))
INITIALISATION
    dishPrices := {} || menus := {} || createdRestaurants := {} || 
    restaurantNames := {} || restaurantAddresses := {} || restaurantVegetarian := {}
OPERATIONS
    result <-- checkRestaurantID(ID) =
    PRE ID : RESTAURANTS
    THEN
        result := bool(ID : createdRestaurants)
    END;
    
    registerRestaurant(name, addr, list, restID) =
    PRE
        name : RESTNAMES &
        addr: RESTADDRESSES &
        list : seq1(dishPrices) &
        size(list) >= 5 & size(list) <= 15 &
        restID : RESTAURANTS &
        restID /: createdRestaurants
    THEN
        restID :: createdRestaurants ||
        restaurantNames(restID) := name ||
        restaurantAddresses(restID) := addr ||
        restaurantVegetarian(restID) := FALSE ||
        dishPrices := dishPrices \/ ran(list) ||
        menus(restID) := ran(list)
    END;
    
    
    result <-- dishInMenu(dishID) =
    PRE
        dishID : DISHES
    THEN
        result := bool(dishID : dom(dishPrices))
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
