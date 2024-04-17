using Nyam_Nyam.DB;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace Nyam_Nyam.Converters
{
    public class IsLessThanConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            Debug.WriteLine($"vals: {values[0]} {values[1].ToString().Replace(',', '.')}");
            int actualVal = (int)values[0];
            double needVal = double.Parse(values[1].ToString().Replace(',', '.'), NumberStyles.Any, CultureInfo.InvariantCulture);

            Debug.WriteLine($"actualVal: {actualVal}");
            Debug.WriteLine($"needVal: {needVal}");

            return actualVal<needVal;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
