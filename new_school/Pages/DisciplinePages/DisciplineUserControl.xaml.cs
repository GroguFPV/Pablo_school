using new_school.Components;
using new_school.Pages.StudentPages;
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

namespace new_school.Pages.DisciplinePages
{
    /// <summary>
    /// Логика взаимодействия для DisciplineUserControl.xaml
    /// </summary>
    public partial class DisciplineUserControl : UserControl
    {
        private Discipline discipline;
        public DisciplineUserControl(Discipline _discipline)
        {
            InitializeComponent();
            if (App.isAdmin == false)
            {
                DelStudentBtn.Visibility = Visibility.Hidden;
                EditStudentBtn.Visibility = Visibility.Hidden;
            }
            discipline = _discipline;
            DisCodeTb.Text = discipline.Code.ToString();
            DisVolTb.Text = discipline.Volume.ToString();
            DisNameTb.Text = discipline.Title.ToString();


            var kaf = App.db.Kafedra.FirstOrDefault(x => x.Kaf_ID == discipline.Kaf_ID);
            DisKaf.Text = kaf.FacultyAbbreviation.ToString();
        }

        private void DelStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Удалено");
            App.db.Discipline.Remove(discipline);
            App.db.SaveChanges();
            Navigation.NextPage(new PageComponent("Список дисциплин", new DisciplinePage()));
        }

        private void EditEmployeebtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Редактирование данных дисципдины", new AddEditDisciplinePages(discipline, "Edit")));
        }
    }
}