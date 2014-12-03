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
    !rr.(rr : createdRestaurants => (card({rr} <| menus) >= 5 & card({rr} <| menus) <= 15))
    //    !rr.(rr : createdRestaurants & restaurantVegetarian(rr) = TRUE =>
    //        !dd.(dd : dom(menus(rr)) => dishVegetarian = TRUE))
    
INITIALISATION
    dishPrices := {} || menus := {} || createdRestaurants := {} || 
    restaurantNames := {} || restaurantAddresses := {} || restaurantVegetarian := {}
OPERATIONS    
    newRestaurant(name, addr, list) =
    PRE
        name : RESTNAMES &
        addr: RESTADDRESSES &
        list : seq1(dishPrices)
    THEN
        ANY rr
        WHERE
            rr : RESTAURANTS & 
            rr /: createdRestaurants
        THEN
            createdRestaurants := createdRestaurants \/ {rr} ||
            restaurantNames(rr) := name ||
            restaurantAddresses(rr) := addr ||
            restaurantVegetarian(rr) := FALSE ||
            dishPrices := dishPrices \/ ran(list) ||
            menus(rr) := ran(list)
        END
    END;
    
    addDishToRestaurant2(rr, dd, pp) = 
    PRE rr : createdRestaurants &
        dd : DISHES &
        pp : NAT
    THEN
        IF dd : dom(menus(rr))
        THEN
            menus(rr)(dd) := pp //If dish already exists update its price
        ELSE
            menus(rr) := menus(rr) \/ { dd |-> pp } //If fish doesn't exist, add {dish --> price}
        END
    END;
    
    removeDishFromRestaurant(rr, dd) =
    PRE rr : createdRestaurants &
        dd : dom(menus(rr))
    THEN
        menus(rr) := {dd} <<| menus(rr) // Remove dish from dish --> NAT
    END;
    
    changePrice2(rr, dd, pp) = 
    PRE
        rr : createdRestaurants & 
        dd : dom(menus(rr)) & 
        pp : NAT
    THEN
        menus(rr)(dd) := pp
    END;
    
    pp <-- getDishPrice(rr, dd) =
    PRE 
        rr : createdRestaurants &
        dd : dom(menus(rr))
    THEN
        pp := menus(rr)(dd) // (todos os menus do rr) -> preço do dd
    END;
    
    setVegetarianRestaurant2(rr, bb) =
    PRE
        rr : createdRestaurants &
        bb : BOOL
    THEN
        restaurantVegetarian(rr) := bb
    END;
    
    res <-- isVegetarianRestaurant(rr) =
    PRE 
        rr : createdRestaurants
    THEN
        res := restaurantVegetarian(rr)
    END;
    name <-- getRestaurantName(rr) =
    PRE 
        rr : createdRestaurants
    THEN
        name := restaurantNames(rr)
    END;
    
    addr <-- getRestaurantAddress(rr) = 
    PRE
        rr : createdRestaurants
    THEN
        addr := restaurantAddresses(rr)
    END;
    
    lrr <-- getRestaurantsDish(dd) =
    PRE
        dd : dom(dishPrices)
    THEN
        lrr := seq(menus |> {{dd} <| dishPrices})
    END;
    
    ldd <-- getDishRestaurant(rr) =
    PRE
        rr : createdRestaurants
    THEN
        ldd := seq(dom(menus(rr)))
    END;
    
    result <-- isDishInAnyMenu(dishID) =
    PRE
        dishID : DISHES
    THEN
        result := bool(dishID : dom(dishPrices))
    END;
    
    
    
    
    
    
END
