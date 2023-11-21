using new_school.Components;
using new_school.Pages.EmployeePages;
using new_school.Pages.StudentPages;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Sockets;
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
    /// Логика взаимодействия для AddEditDisciplinePages.xaml
    /// </summary>
    public partial class AddEditDisciplinePages : Page
    {
        private Discipline discipline;
        public string AddorEdit;
        public AddEditDisciplinePages(Discipline _discipline, string _addorEdit)
        {
            InitializeComponent();
            discipline = _discipline;

            this.DataContext = discipline;
            DisCode.MaxLength = 3;
            DisCode.Text = discipline.Code.ToString();
            DisVolume.Text = discipline.Volume.ToString();
            DisName.Text = "test";
            KadCb.ItemsSource = App.db.Kafedra.ToList();
            KadCb.DisplayMemberPath = "FacultyAbbreviation";
            AddorEdit = _addorEdit;


        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            bool errors = false;

            var selectKafAb = KadCb.SelectedItem as Kafedra;

            if (selectKafAb != null)
            {
                if (string.IsNullOrEmpty(DisCode.Text) || string.IsNullOrEmpty(DisVolume.Text) || string.IsNullOrEmpty(DisName.Text))
                {
                    MessageBox.Show("Введите все данные!");
                    return;
                }

                if (discipline.Code != 0 && AddorEdit == "Add")
                {
                    if (App.db.Discipline.Any(x => x.Kaf_ID == discipline.Kaf_ID))
                    {
                        MessageBox.Show("Код уже занят");
                        return;
                    }
                }

                errors = true;
                discipline.Kaf_ID = selectKafAb.Kaf_ID;

                if (AddorEdit == "Add")
                {
                    App.db.Discipline.Add(discipline);
                }
                else
                {
                    App.db.Entry(discipline).State = EntityState.Modified;
                }

                App.db.SaveChanges();
                Navigation.NextPage(new PageComponent("Список дисциплин", new DisciplinePage()));
                MessageBox.Show("Сохранено!");
            }
            else
            {
                MessageBox.Show("Ошибка");
            }
        }

        //   else MessageBox.Show("Ошибка"); Navigation.NextPage(new PageComponent("Добавление сотрудника", new AddEditEmployeePage(new Employee())));

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }
    }
}
