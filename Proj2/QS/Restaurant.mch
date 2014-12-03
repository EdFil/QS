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
    !res. (res: createdRestaurants => restaurantNames(res) : RESTNAMES) &
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
    
    registerRestaurant(name, addr, ldish, lprice, restID) =
    PRE
        name : RESTNAMES &
        addr: RESTADDRESSES &
        ldish : iseq1(DISHES) &
        lprice : iseq1(NAT) &
        size(ldish) >= 5 & size(ldish) <= 15 &
        size(lprice) = size(ldish) &
        restID : RESTAURANTS &
        restID /: createdRestaurants
    THEN
        restID :: createdRestaurants ||
        restaurantNames(restID) := name ||
        restaurantAddresses(restID) := addr ||
        restaurantVegetarian(restID) := FALSE
       /* WHILE
            size(lprice) > 0 
        DO
            createdRestaurants(restID) := first(ldish) ||
            //TODO: same for price
            ldish := tail(ldish) ||
            lprice := tail(lprice)
        INVARIANT
            size(lprice) : NAT1 &
            size(lprice) > 0
        VARIANT
            listSize            
        END */
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
