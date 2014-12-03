/* Rest
 * Author: Grupo 9
 * Creation date: 28/11/2014
 */
MACHINE
    Rest
INCLUDES
    Restaurant, Dish, ShoppingTray
PROMOTES
    newDish, getDishName, getDishDescription, isVegetarianDish, //PROMOTED DISH OPS
    newRestaurant
    
CONSTANTS
    maxPrice
PROPERTIES
    maxPrice : NAT
OPERATIONS
    //////////////////////////////////////// DISH OPERATIONS /////////////////////////////////
    removeDish(dd) =
    PRE 
        dd : DISHES & isDishInAnyMenu(dd) = FALSE
    THEN
        deleteDish(dd)
    END;

   
   //////////////////////////////////////// RESTAURANT OPERATIONS /////////////////////////////////   
//    pp <-- getDishPrice(rr, dd) =
//    PRE rr : RESTAURANTS & dd : DISHES & dishInMenu(dd) = TRUE
//    THEN
//        pp := menuPrices(menus(dd))
//    END;
   
   
//    setVegetarianRestaurant(rr,bb) =
//    PRE rr : RESTAURANTS & bb : BOOL
//    THEN
//        restaurantVegetarian(rr) := bb
//    END;
    
    
//    res <-- isVegetarianRestaurant(rr) =
//    PRE rr : RESTAURANTS
//    THEN
//        res := restaurantVegetarian(rr) 
//    END;
    
    
//    name <-- getRestaurantName(rr) =
//    PRE rr : RESTAURANTS
//    THEN
//        name := restaurantNames(rr)
//    END;

    
//    addr <-- getRestaurantAddress(rr) =
//    PRE rr : RESTAURANTS
//    THEN
//        addr := restaurantAddresses(rr)
//    END;
    
    

    
//    ldd <-- getDishRestaurant(rr) =
//    PRE rr : RESTAURANTS 
//    THEN
//        ldd := dom(menus(rr))
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
