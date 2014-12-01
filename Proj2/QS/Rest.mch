/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
INCLUDES
    Restaurant, Dish, ShoppingTray
CONSTANTS
    maxPrice
PROPERTIES
    maxPrice : NAT
OPERATIONS
    //////////////////////////////////// DISH OPERATIONS ////////////////////////////////
    newDish(name, desc, isVeg) = 
    PRE name : NAMES & desc : DESCRIPTIONS & isVeg : BOOL
    THEN
        ANY dish
        WHERE
            dish : DISHES & 
            checkDishID(dish) = FALSE & 
            checkRestaurantID(dish) = FALSE &
            checkTrayID(dish) = FALSE &
            checkClientID(dish) = FALSE
        THEN
            registerDish(name, desc, isVeg, dish)
        END
    END;
    

    removeDish(dd) =
    PRE 
        dd : DISHES & dishInMenu(dd) = FALSE
    THEN
        deleteDish(dd)
    END; 
 
    
    name <-- getDishName(dd) =
    PRE dd : DISHES
    THEN
        name := dishNames(dd) 
    END;

    
    desc <-- getDishDescription(dd) =
    PRE dd : DISHES
    THEN
        desc := dishDescriptions(dd)
    END;


    bb <--isVegetarianDish(dd) =
    PRE dd : DISHES
    THEN
        bb := dishVegetarian(dd)
    END;

   
   //////////////////////////////////////// RESTAURANT OPERATIONS /////////////////////////////////
    setVegetarianRestaurant(rr,bb) =
    PRE rr : RESTAURANTS & bb : BOOL
    THEN
        restaurantVegetarian(rr) := bb
    END;
    
    
    res <-- isVegetarianRestaurant(rr) =
    PRE rr : RESTAURANTS
    THEN
        res := restaurantVegetarian(rr) 
    END;
    
    
    name <-- getRestaurantName(rr) =
    PRE rr : RESTAURANTS
    THEN
        name := restaurantNames(rr)
    END;

    
    addr <-- getRestaurantAddress(rr) =
    PRE rr : RESTAURANTS
    THEN
        addr := restaurantAddresses(rr)
    END;
    
    
    ldd <-- getDishRestaurant(rr) =
    PRE rr : RESTAURANTS 
    THEN
        ldd := menus(rr)
    END;
    
//    pp <-- getDishPrice(rr, dd) =
//    PRE rr : RESTAURANTS & dd : DISHES & dishInMenu(dd) = TRUE
//    THEN
//        pp := menuPrices(menus(dd))
//    END;

    
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
