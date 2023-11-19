using new_school.Components;
using new_school.Pages.EmployeePages;
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

namespace new_school.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
        }
        private void EmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeeTb.Text == "0000")
            {
                //Navigation.NextPage(new PageComponent("Список результата экзаменов", new ExamPage()));
                App.isAdmin = true;
            }
            else MessageBox.Show("Необходимо ввести 0000");
        }

        private void EmployeeBtn_Click_1(object sender, RoutedEventArgs e)
        {
            if (EmployeeTb.Text == "0000")
            {
                Navigation.NextPage(new PageComponent("Список сотрудников", new EmployeeListPage()));
                App.isAdmin = true;
            }
            else MessageBox.Show("Необходимо ввести 0000");
        }

        private void StudentBtn_Click_1(object sender, RoutedEventArgs e)
        {

        }
    }
}
