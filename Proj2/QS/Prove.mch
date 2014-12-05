Verificação da Correcção da Operação

removeDish2:

(C ∧ Prop ∧ I ∧ P) ⇒ [S]I ⇔

 ⇔ (C ∧ Prop ∧ I ∧ P) ⇒ [   dishNames := {dd} ◀ dishNames ||
                            dishDescriptions := {dd} ◀ dishDescriptions ||
                            dishVegetarian := {dd} ◀ dishVegetarian ||
                            createdDishes := createdDishes - {dd}  ] I

 ⇔ (C ∧ Prop ∧ I ∧ P) ⇒ [   dishNames := {dd} ◀ dishNames ||
                            dishDescriptions := {dd} ◀ dishDescriptions ||
                            dishVegetarian := {dd} ◀ dishVegetarian ||
                            createdDishes := createdDishes - {dd}  ] (  createdDishes ⊆ DISHES ∧ (I1)
                                                                        dishNames ∈ createdDishes ↣ NAMES ∧ (I2)
                                                                        dishDescriptions ∈ createdDishes → DESCRIPTIONS ∧ (I3)
                                                                        dishVegetarian ∈ createdDishes → BOOL ) (I4)
⇔ (C ∧ Prop ∧ I ∧ P) ⇒ (createdDishes - {dd} ⊆ DISHES ∧ (1)
                                      {dd} ◀ dishNames ∈ createdDishes ↣ NAMES ∧ (2)
                           {dd} ◀ dishDescriptions ∈ createdDishes → DESCRIPTIONS ∧ (3)
                           {dd} ◀ dishVegetarian ∈ createdDishes → BOOL) (4)

(1) Pelo I1, createdDishes ⊆ DISHES
       Logo, ao retirar dd, createdDishes continua contido.

(2) Pelo I2, dishNames ∈ createdDishes ↣ NAMES
        Logo, ao retirar uma associação, dishNames continua a pertencer

(3) Pelo I3, dishDescriptions ∈ createdDishes ↣ DESCRIPTIONS
        Logo, ao retirar uma associação, dishDescriptions continua a pertencer

(4) Pelo I4, dishDescriptions ∈ createdDishes ↣ BOOL
        Logo, ao retirar uma associação, dishDescriptions continua a pertencer

