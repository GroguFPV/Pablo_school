using new_school.Components;
using new_school.Pages.EmployeePages;
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

namespace new_school.Pages.StudentPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditStudentPage.xaml
    /// </summary>
    public partial class AddEditStudentPage : Page
    {
        private Student student;
        public string AddorEdit;
        public AddEditStudentPage(Student _student, string _AddorEdit)
        {
            InitializeComponent();

            student = _student;
            AddorEdit = _AddorEdit;

            this.DataContext = student;
            StudentTabNum.MaxLength = 5;
            if (student != null && student.RegNumber > 0) StudentTabNum.IsReadOnly = true;
            SpecCb.ItemsSource = App.db.Specialty.ToList();
            SpecCb.DisplayMemberPath = "Direction";



        }
        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            bool errors = false;


            
            var selectSpec = SpecCb.SelectedItem as Specialty;

            if (selectSpec != null)
            {
                if (StudentTabNum.Text.Length != 5)
                {
                    errors = true;

                    MessageBox.Show("Длина табелного номера должна состоять из 5 символов!");
                    Navigation.NextPage(new PageComponent("Добавление студента", new AddEditStudentPage(new Student(), "Add")));
                }

                if (student.RegNumber != 0 && AddorEdit == "Add")
                {
                    if (App.db.Student.Any(x => x.RegNumber == student.RegNumber))
                    {
                        MessageBox.Show("Рег. номер занят другим студентом");
                        Navigation.NextPage(new PageComponent("Добавление студента", new AddEditStudentPage(new Student(), "Add")));
                        return; // Добавьте эту строку, чтобы прервать выполнение кода далее
                    }
                }

                if (errors == false)
                {

                    student.Spec_ID = selectSpec.SpecID;
                    if(AddorEdit == "Add")
                    {
                        App.db.Student.Add(student);
                    }
                    else App.db.Entry(student).State = EntityState.Modified;
                    


                    App.db.SaveChanges();
                    Navigation.NextPage(new PageComponent("Список студентов", new StudentListPage()));
                    MessageBox.Show("Сохранено!");
                }


                else MessageBox.Show("Ошибка"); Navigation.NextPage(new PageComponent("Добавление студента", new AddEditStudentPage(new Student(), "Add")));
            }
            else MessageBox.Show("Ошибка"); Navigation.NextPage(new PageComponent("Добавление студента", new AddEditStudentPage(new Student(), "Add")));
        }
           
        
    }
}
