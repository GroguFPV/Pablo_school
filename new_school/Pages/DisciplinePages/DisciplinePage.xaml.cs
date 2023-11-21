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

namespace new_school.Pages.DisciplinePages
{
    /// <summary>
    /// Логика взаимодействия для DisciplinePage.xaml
    /// </summary>
    public partial class DisciplinePage : Page
    {
        public DisciplinePage()
        {
            InitializeComponent();
            Refresh();
        }

        private void Refresh()
        {
            ///////////////////////////////////////////////////////////////////
            IEnumerable<Discipline> disListSort = App.db.Discipline;
            if (SortCb.SelectedIndex != 0)
            {
                if (SortCb.SelectedIndex == 1)
                {
                    disListSort = disListSort.OrderBy(x => x.Volume);
                }
                else if (SortCb.SelectedIndex == 2)
                {
                    disListSort = disListSort.OrderBy(x => x.Title);
                }

            }

            if (searchTB.Text != null)
            {
                disListSort = disListSort.Where(x => x.Title.ToLower().Contains
                (searchTB.Text.ToLower()));

            }

            DisWP.Children.Clear();
            foreach (var discipline in disListSort)
            {
                DisWP.Children.Add(new DisciplineUserControl(discipline));
            }

        }

        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }
        private void SortCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void AddDisBtn_Click(object sender, RoutedEventArgs e)
        {
             Navigation.NextPage(new PageComponent("Добавление дисциплины", new AddEditDisciplinePages(new Discipline(), "Add")));
        }
    }
}
