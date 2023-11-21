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
    /// Логика взаимодействия для EmployeeUserControl.xaml
    /// </summary>
    public partial class EmployeeUserControl : UserControl
    {
        private Employee employee;

        public EmployeeUserControl(Employee _employee)
        {
            InitializeComponent();
            employee = _employee;
            EmployeeID.Text = employee.TabNumber.ToString();
            EmployeeLastName.Text = employee.LastName.ToString();

            var position = App.db.Position.FirstOrDefault(x => x.PositionID == employee.PositionID);
            EmployeePosition.Text = position.Position1;

            var kafedra = App.db.Kafedra.FirstOrDefault(x => x.Kaf_ID == employee.Kaf_id);
            EmployeуKaf.Text = kafedra.Name;

            EmployeуSalary.Text = employee.Salary.ToString();

            var shef = App.db.Employee.FirstOrDefault(x => x.Shef == employee.Shef);
            EmployeуShef.Text = shef.LastName.ToString();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            MessageBox.Show("Удалено");
            App.db.Employee.Remove(employee);
            App.db.SaveChanges();
            Navigation.NextPage(new PageComponent("Список услуг", new EmployeeListPage()));
        }

        private void EditEmployeebtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Редактирование данных сотрудника", new AddEditEmployeePage(employee, "Edit")));
        }
    }
}
