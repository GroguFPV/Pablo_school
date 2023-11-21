using new_school.Components;
using new_school.Pages.EmployeePages;
using new_school.Pages.StudentPages;
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

namespace new_school.Pages.ExamPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditExamPage.xaml
    /// </summary>
    public partial class AddEditExamPage : Page
    {
        private Exam exam;
        public string AddorEdit;
        public AddEditExamPage(Exam _exam, string _addorEdit)
        {
            InitializeComponent();
            exam = _exam;
            this.DataContext = exam;
            //ExamDateDP.DataContext = exam.Date.ToString();
            ExamDisCb.ItemsSource = App.db.Discipline.ToList();
            ExamDisCb.DisplayMemberPath = "Title";

            ExamStudentCb.ItemsSource = App.db.Student.ToList();
            ExamStudentCb.DisplayMemberPath = "RegNumber";

            ExamEmCb.ItemsSource = App.db.Employee.ToList();
            ExamEmCb.DisplayMemberPath = "TabNumber";

            ExamAudiCb.ItemsSource = App.db.Auditorium.ToList();
            ExamAudiCb.DisplayMemberPath = "Auditorium1";
            ExamGradeTb.Text = exam.Grade.ToString();
            AddorEdit = _addorEdit;
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            bool errors = false;



            var selectDis = ExamDisCb.SelectedItem as Discipline;
            var selectStu = ExamStudentCb.SelectedItem as Student;
            var selectEm = ExamEmCb.SelectedItem as Employee;
            
            var selAudi = ExamAudiCb.SelectedItem as Auditorium;



            if (selectDis == null)
            {
                MessageBox.Show("Выберите дисциплину");
                errors = true;
                return;
            }

            if (selectStu == null)
            {
                MessageBox.Show("Выберите студента");
                errors = true;
                return;
            }

            if (selectEm == null)
            {
                MessageBox.Show("Выберите преподавателя");
                errors = true;
                return;
            }

            if (selAudi == null)
            {
                MessageBox.Show("Выберите аудиторию");
                errors = true;
                return;
            }

            if (string.IsNullOrEmpty(ExamGradeTb.Text))
            {
                MessageBox.Show("Введите оценку");
                errors = true;
                return;
            }

            double grade;
            if (!double.TryParse(ExamGradeTb.Text, out grade))
            {
                MessageBox.Show("Неверный формат оценки");
                errors = true;
                return;
            }

            if (exam.ExamID != 0 && AddorEdit == "Add")
            {
                if (App.db.Exam.Any(x => x.ExamID == exam.ExamID))
                {
                    MessageBox.Show("ID занят");
                    Navigation.NextPage(new PageComponent("Добавление экзамена", new AddEditExamPage(new Exam(), "Add")));
                    return;
                }
            }

            if (errors == false)
            {
                if (AddorEdit == "Add")
                {
                    App.db.Exam.Add(exam);
                }
                else
                {
                    App.db.Entry(exam).State = EntityState.Modified;
                }

                App.db.SaveChanges();
                Navigation.NextPage(new PageComponent("Список экзаменов", new ExamListPage()));
                MessageBox.Show("Сохранено!");
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

