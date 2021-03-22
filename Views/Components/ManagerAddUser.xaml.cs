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

namespace DemEkzDemo.Views.Components
{
    /// <summary>
    /// Interaction logic for ManagerAddUser.xaml
    /// </summary>
    public partial class ManagerAddUser : UserControl
    {
        public ManagerAddUser()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextBox tb = sender as TextBox;
            tb.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox cb = sender as ComboBox;
            cb.GetBindingExpression(ComboBox.SelectedIndexProperty).UpdateSource();
        }

        private void Calendar_SelectedDatesChanged(object sender, SelectionChangedEventArgs e)
        {
            Calendar cl = sender as Calendar;
            cl.GetBindingExpression(Calendar.SelectedDateProperty).UpdateSource();
        }
    }
}
