﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nyam_Nyam.DB
{
    internal class DBConnection
    {
        public static NyamNyamEntities5 nyamNyam = new NyamNyamEntities5();

        public static Dish selectedDish;
        public static Ingredient selectedIngredient;
    }
}
