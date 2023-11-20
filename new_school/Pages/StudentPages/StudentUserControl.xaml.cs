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

namespace new_school.Pages.StudentPages
{
    /// <summary>
    /// Логика взаимодействия для StudentUserControl.xaml
    /// </summary>
    public partial class StudentUserControl : UserControl
    {
        private Student student;
        public StudentUserControl(Student _student)
        {
            InitializeComponent();
            if(App.isAdmin == false)
            {
                DelStudentBtn.Visibility = Visibility.Hidden;
                EditStudentBtn.Visibility = Visibility.Hidden;
            }
            student = _student;
            StudentTabNumber.Text = student.RegNumber.ToString();
            StudentLastName.Text = student.LastName.ToString();

            

            var spec = App.db.Specialty.FirstOrDefault(x => x.SpecID == student.Spec_ID);
            StudentSpec.Text = spec.Direction;

            
        }

        private void DelStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Удалено");
            App.db.Student.Remove(student);
            App.db.SaveChanges();
            Navigation.NextPage(new PageComponent("Список студентов", new StudentListPage()));
        }

        private void EditEmployeebtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Редактирование данных студента", new AddEditStudentPage(student, "Edit")));
        }
    }
}
