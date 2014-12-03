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
    newDish, getDishName, getDishDescription, isVegetarianDish,
    //PROMOTED RESTAURANT OPS
    newRestaurant, removeDishFromRestaurant, getDishPrice, isVegetarianRestaurant, getRestaurantName, getRestaurantAddress, getRestaurantsDish, getDishRestaurant
OPERATIONS
    //////////////////////////////////////// DISH OPERATIONS /////////////////////////////////
    removeDish(dd) =
    PRE 
        dd : DISHES & isDishInAnyMenu(dd) = FALSE
    THEN
        deleteDish(dd)
    END;

//////////////////////////////////////// RESTAURANT OPERATIONS /////////////////////////////////   

    addDishToRestaurant(rr, dd, pp) = 
    PRE rr : createdRestaurants &
        dd : createdDishes &
        pp : NAT &
        pp <= maxPrice
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
        bb : BOOL
    THEN
        SELECT bb = FALSE
            THEN setVegetarianRestaurant2(rr, bb)
        WHEN bb = TRUE & !dd.(dd : dom(menus(rr)) => dishVegetarian(dd) = TRUE)
            THEN setVegetarianRestaurant2(rr, bb)
        ELSE
            skip
        END
  
    END;




    
    ///////////////////////////////////// TRAY OPERATIONS ///////////////////////////////////////
        // ver se o cliente pode ter apenas uma tray
    newTray(cc) =
    PRE cc : CLIENTS
    THEN
        ANY tray
        WHERE
            tray : TRAYS &
            checkTrayID(tray) = FALSE 
        THEN
            registerTray(cc,tray)
        END
    END;
    
    
    addDishToTray(tr,dd) =
    PRE tr : TRAYS & dd : DISHES
    THEN
        addDish(tr,dd)
    END;
    


END
