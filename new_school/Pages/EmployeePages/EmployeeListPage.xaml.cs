using new_school.Components;
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

namespace new_school.Pages.EmployeePages
{
    /// <summary>
    /// Логика взаимодействия для EmployeeListPage.xaml
    /// </summary>
    public partial class EmployeeListPage : Page
    {
        public EmployeeListPage()
        {
            InitializeComponent();
            Refresh();
        }

        private void Refresh()
        {
            ///////////////////////////////////////////////////////////////////
            IEnumerable<Employee> emListSort = App.db.Employee;
            if (SortCb.SelectedIndex != 0)
            {
                if (SortCb.SelectedIndex == 1)
                {
                    emListSort = emListSort.OrderBy(x => x.TabNumber);
                }
                else if (SortCb.SelectedIndex == 2)
                {
                    emListSort = emListSort.OrderBy(x => x.LastName);
                }

            }

            if (searchTB.Text != null)
            {
                emListSort = emListSort.Where(x => x.LastName.ToLower().Contains
                (searchTB.Text.ToLower()));

            }

            EmWP.Children.Clear();
            foreach (var employee in emListSort)
            {
                EmWP.Children.Add(new EmployeeUserControl(employee));
            }
            
        }


        private void AddEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Добавление сотрудника", new AddEditEmployeePage(new Employee())));
        }
        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }
        private void SortCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }
    }
}
