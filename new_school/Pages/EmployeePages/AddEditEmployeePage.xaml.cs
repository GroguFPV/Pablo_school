using new_school.Components;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для AddEditEmployeePage.xaml
    /// </summary>
    public partial class AddEditEmployeePage : Page
    {
        private Employee employee;
        public string AddorEdit;
        public AddEditEmployeePage(Employee _employee, string _addorEdit)
        {
            InitializeComponent();
            employee = _employee;
            
            this.DataContext = employee;
            TabNum.MaxLength = 3;
            PositionCb.ItemsSource = App.db.Position.ToList();
            PositionCb.DisplayMemberPath = "Position1";
            KafedraCb.ItemsSource = App.db.Kafedra.ToList();
            KafedraCb.DisplayMemberPath = "Code";
            ShefCb.ItemsSource = App.db.Employee.ToList();
            ShefCb.DisplayMemberPath = "TabNumber";
            ShefCb.SelectedItem = employee.Employee1;

            AddorEdit = _addorEdit;
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            bool errors = false;


            var selectKaf_id = KafedraCb.SelectedItem as Kafedra;
            var selectPosition = PositionCb.SelectedItem as Position;
            var selectShef = ShefCb.SelectedItem as Employee;

            if (selectKaf_id != null)
            {
                if (TabNum.Text.Length != 3)
                {
                    MessageBox.Show("Длина табелного номера должна состоять из 3 символов!");
                    Navigation.NextPage(new PageComponent("Добавление сотрудника", new AddEditEmployeePage(new Employee(), "Add")));
                    errors = true;
                }

                if (App.db.Employee.Any(x => x.TabNumber == employee.TabNumber && AddorEdit == "Add"))
                {
                    errors = true;
                    MessageBox.Show("Табельный номер занят другим сотрудником");
                }

                employee.Kaf_id = selectKaf_id.Kaf_ID;
                if (selectPosition != null)
                {
                    employee.PositionID = selectPosition.PositionID;
                    if (selectShef != null)
                    {
                        employee.Shef = selectShef.TabNumber;
                        if (errors == false)
                        {

                            App.db.Employee.Add(employee);
                            employee.Kaf_id = selectKaf_id.Kaf_ID;
                            employee.PositionID = selectPosition.PositionID;
                            employee.Shef = selectShef.Shef;

                            if (AddorEdit == "Add")
                            {
                                App.db.Employee.Add(employee);
                            }
                            
                            else App.db.Entry(employee).State = EntityState.Modified;

                            MessageBox.Show("Сохранено!");
                            App.db.SaveChanges();
                            Navigation.NextPage(new PageComponent("Список сотрудников", new EmployeeListPage()));
                        }
                    }
                }

            }
            
           
        }
        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }
    }
}
