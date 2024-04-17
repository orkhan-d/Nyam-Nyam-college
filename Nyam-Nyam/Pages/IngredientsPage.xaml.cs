using Nyam_Nyam.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Nyam_Nyam.Pages
{
    /// <summary>
    /// Логика взаимодействия для IngredientsPage.xaml
    /// </summary>
    public partial class IngredientsPage : Page
    {
        public static List<Category> categories { get; set; }
        public static List<Dish> dishes { get; set; }
        public static Dish dish { get; set; }
        public static List<Ingredient> ingredients { get; set; }

        public IngredientsPage()
        {
            InitializeComponent();
            Refresh();
        }

        private void Refresh()
        {
            ingredients = DBConnection.nyamNyam.Ingredient.ToList();
            TotalPrice.Text = ingredients.Select(row => (int)row.AvailableCount * (int)row.CostInCents).ToList().Sum().ToString();
            IngredientsLV.ItemsSource = ingredients.ToList();
        }

        private void Hyperlink_Click(object sender, RoutedEventArgs e)
        {
            int ingredientId = (int)(((Hyperlink)sender).DataContext);
            if (DBConnection.nyamNyam.IngredientOfStage.ToList().Where(row => row.IngredientId == ingredientId).Count() > 0)
            {
                MessageBoxResult res = MessageBox.Show("Are you sure? Dished use it!", "Confirmation", MessageBoxButton.YesNo);
                if (res.ToString() == "Yes")
                {
                    DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount = 0;
                    DBConnection.nyamNyam.SaveChanges();
                }
            }
            else
            {
                DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount = 0;
                DBConnection.nyamNyam.SaveChanges();
            }
            Refresh();
        }
        private void MinusBtn_Click(object sender, RoutedEventArgs e)
        {
            int ingredientId = (int)(((Button)sender).DataContext);
            int count = (int)DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount;
            DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount = Math.Max(count - 1, 0);
            DBConnection.nyamNyam.SaveChanges();
            Refresh();
        }
        private void PlusBtn_Click(object sender, RoutedEventArgs e)
        {
            int ingredientId = (int)(((Button)sender).DataContext);
            int count = (int)DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount;
            DBConnection.nyamNyam.Ingredient.Find(ingredientId).AvailableCount = count + 1;
            DBConnection.nyamNyam.SaveChanges();
            Refresh();
        }
    }
}
