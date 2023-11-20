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
    /// Логика взаимодействия для StudentListPage.xaml
    /// </summary>
    public partial class StudentListPage : Page
    {
        public StudentListPage()
        {
            InitializeComponent();
            Refresh();
            if(App.isAdmin == false
                )
            {
                AddStudentBtn.Visibility = Visibility.Hidden;
                
            }
        }

        private void Refresh()
        {
            ///////////////////////////////////////////////////////////////////
            IEnumerable<Student> stListSort = App.db.Student;
            if (StudentSortCb.SelectedIndex != 0)
            {
                if (StudentSortCb.SelectedIndex == 1)
                {
                    stListSort = stListSort.OrderBy(x => x.RegNumber);
                }
                else if (StudentSortCb.SelectedIndex == 2)
                {
                    stListSort = stListSort.OrderBy(x => x.LastName);
                }

            }

            if (searchTB.Text != null)
            {
                stListSort = stListSort.Where(x => x.LastName.ToLower().Contains(searchTB.Text.ToLower()) || x.Spec_ID.ToString().ToLower().Contains(searchTB.Text.ToLower())
                || x.RegNumber.ToString().ToLower().Contains(searchTB.Text.ToLower()));

            }

            StudentWP.Children.Clear();
            foreach (var student in stListSort)
            {
                StudentWP.Children.Add(new StudentUserControl(student));
            }

        }


        private void AddEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Добавление студента", new AddEditStudentPage(new Student(), "Add")));
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
