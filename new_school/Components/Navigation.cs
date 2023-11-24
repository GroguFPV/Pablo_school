using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace new_school.Components
{
    static class Navigation
    {
        private static List<PageComponent> components = new List<PageComponent>();
        public static MainWindow mainWindow;

        public static void ClearHistory()
        {
            
            components.Clear();
            App.isAdmin = false;
        }

        private static void Update(PageComponent pageComponent)
        {
            mainWindow.TitleTB.Text = pageComponent.Title;
            mainWindow.BackBtn.Visibility = components.Count() >
                1 ? System.Windows.Visibility.Visible :
                System.Windows.Visibility.Hidden;
            mainWindow.ExitBtn.Visibility = App.isAdmin ?
                System.Windows.Visibility.Visible :
                System.Windows.Visibility.Hidden;
            mainWindow.MainFrame.Navigate(pageComponent.Page);

            if(App.isAdmin == true)
            {
                mainWindow.EmListMWbtn.Visibility = System.Windows.Visibility.Visible;
                mainWindow.ExamListMWbtn.Visibility = System.Windows.Visibility.Visible;
                mainWindow.StudentListMWbtn.Visibility =System.Windows.Visibility.Visible;
                mainWindow.DisciplineListMWbtn.Visibility = System.Windows.Visibility.Visible;
            }
            else
            {
                
                mainWindow.EmListMWbtn.Visibility = System.Windows.Visibility.Hidden;
                mainWindow.ExamListMWbtn.Visibility = System.Windows.Visibility.Hidden;
                mainWindow.StudentListMWbtn.Visibility = System.Windows.Visibility.Hidden;
                mainWindow.DisciplineListMWbtn.Visibility = System.Windows.Visibility.Hidden;
            }
        }

        public static void NextPage(PageComponent pageComponent)
        {
            components.Add(pageComponent);
            Update(pageComponent);
        }

        public static void BackPage()
        {
            if (components.Count > 1)
            {
                components.RemoveAt(components.Count - 1);
                Update(components[components.Count - 1]);
            }
        }
    }
    class PageComponent
    {
        public string Title { get; set; }
        public Page Page { get; set; }

        public PageComponent(string title, Page page)
        {
            Page = page;
            Title = title;

        }

    }
}
