/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest(maxPrice)
CONSTRAINTS
    maxPrice : NAT1
INCLUDES
    Restaurant, Dish, ShoppingTray
PROMOTES
    //PROMOTED DISH OPS
    getDishName, getDishDescription, isVegetarianDish,
    //PROMOTED RESTAURANT OPS
    newRestaurant, removeDishFromRestaurant, getDishPrice, isVegetarianRestaurant, getRestaurantName, getRestaurantAddress, getRestaurantsDish, getDishRestaurant,
    // PROMOTED TRAY OPS
    newTray, removeDishFromTray, checkoutTray, cancelTray
OPERATIONS
    //////////////////////////////////////// DISH OPERATIONS /////////////////////////////////
    newDish(name, desc, isVeg) =
    PRE name : NAMES & desc : DESCRIPTIONS & isVeg : BOOL
    THEN
        ANY dd
        WHERE
            dd : DISHES &
            dd /: createdDishes
        THEN
            newDish2(name, desc, isVeg, dd) ||
            newDishInTray(dd)
        END
    END;
    
   
    removeDish(dd) =
    PRE 
        dd : createdDishes &
        dd /: dom(dishPrices) &
        !dt.(dt : trayDishes~[{{dd}}] => card(({dt} <| status) |>> {PAID}) = 0)
    THEN
        removeDish2(dd)
    END;

//////////////////////////////////////// RESTAURANT OPERATIONS /////////////////////////////////   
    addDishToRestaurant(rr, dd, pp) = 
    PRE rr : createdRestaurants &
        dd : createdDishes &
        pp : NAT &
        pp <= maxPrice &
        (restaurantVegetarian(rr) = FALSE or 
            restaurantVegetarian(rr) = dishVegetarian(dd))
    THEN
        addDishToRestaurant2(rr, dd, pp)
    END;


    changePrice(rr, dd, pp) = 
    PRE
        rr : createdRestaurants & 
        dd : dom(menus(rr)) & 
        pp : NAT &
        pp <= maxPrice
    THEN
        changePrice2(rr, dd, pp)
    END;


    setVegetarianRestaurant(rr,bb) =
    PRE 
        rr : createdRestaurants & 
        bb : BOOL &
        (bb = TRUE) => !dd.(dd : DISHES  => dishVegetarian(dd) = TRUE)
    THEN 
        setVegetarianRestaurant2(rr, bb)
    END;
    
///////////////////////////////////// TRAY OPERATIONS ///////////////////////////////////////

    addDishToTray(tr, dd) =
    PRE tr : createdTrays &
        dd : dishes &
        dd /: trayDishes(tr) &
        status(tr) = OPEN &
        bool(dd : dom(dishPrices)) = TRUE
    THEN
        addDishToTray2(tr, dd)
    END;

    pp <-- computePriceOfTray(tr) =
    PRE tr : createdTrays
    THEN
        pp := SIGMA dd . (dd : trayDishes(tr) | min(ran({dd} <| dishPrices))) 
    END;
    
    payTray(tr) =
    PRE tr : createdTrays & status(tr) = CLOSED
    THEN
        payTray2(tr, SIGMA dd . (dd : trayDishes(tr) | min(ran({dd} <| dishPrices)))) // <--- 
    END;
       
END
