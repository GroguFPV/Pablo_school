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

namespace new_school.Pages.ExamPages
{
    /// <summary>
    /// Логика взаимодействия для ExamListPage.xaml
    /// </summary>
    public partial class ExamListPage : Page
    {
        public ExamListPage()
        {
            InitializeComponent();
            Refresh();
        }

        private void Refresh()
        {
            ///////////////////////////////////////////////////////////////////
            IEnumerable<Exam> examListSort = App.db.Exam;
            if (SortCb.SelectedIndex != 0)
            {
                if (SortCb.SelectedIndex == 1)
                {
                    examListSort = examListSort.OrderBy(x => x.TabNumber);
                }
                else if (SortCb.SelectedIndex == 2)
                {
                    examListSort = examListSort.OrderBy(x => x.Grade);
                }

            }

            if (searchTB.Text != null)
            {
                examListSort = examListSort.Where(x => x.Student.LastName.ToLower().Contains(searchTB.Text.ToLower()) || x.Discipline.Title.ToLower().Contains(searchTB.Text.ToLower()));

            }

            ExamWP.Children.Clear();
            foreach (var exam in examListSort)
            {
                ExamWP.Children.Add(new ExamUserControl(exam));
            }

        }


        private void AddEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            
        }
        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }
        private void SortCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void AddExamBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Добавление резльтата экзамена", new AddEditExamPage(new Exam(),"Add")));
        }
    }
}