using System;
using new_school.Components;
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
using new_school.Pages.StudentPages;

namespace new_school.Pages.ExamPages
{
    /// <summary>
    /// Логика взаимодействия для ExamUserControl.xaml
    /// </summary>
    public partial class ExamUserControl : UserControl
    {
        private Exam exam;
        public ExamUserControl(Exam _exam)
        {
            InitializeComponent();
            if (App.isAdmin == false)
            {
                DelExamBtn.Visibility = Visibility.Hidden;
                EditExamBtn.Visibility = Visibility.Hidden;
            }
            exam = _exam;
            ExamNum.Text = exam.ExamID.ToString();
            ExamDate.Text = exam.Date.ToString();
            var dis = App.db.Discipline.FirstOrDefault(x => x.Code == exam.Dis_Code);

            ExamSpec.Text = dis.Title.ToString();
            ExamRegHum.Text = exam.RegNumber.ToString();
            ExamTabHum.Text = exam.TabNumber.ToString();    
            ExamGrade.Text = exam.Grade.ToString();
            var audi = App.db.Auditorium.FirstOrDefault(x => x.AuditoriumID == exam.AuditoriumID);

            ExamAudi.Text = audi.Auditorium1.ToString();
        }

        private void EditExamBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Редактирование результата экзамена", new AddEditExamPage(exam, "Edit")));
        }

        private void DelExamBtn_Click(object sender, RoutedEventArgs e)
        {
            
            App.db.Exam.Remove(exam);
            App.db.SaveChanges();
            MessageBox.Show("Удалено");
            Navigation.NextPage(new PageComponent("Список экзаменов", new ExamListPage()));
        }
    }
}