﻿using new_school.Components;
using new_school.Pages;
using new_school.Pages.DisciplinePages;
using new_school.Pages.EmployeePages;
using new_school.Pages.ExamPages;
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

namespace new_school
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();


            Navigation.mainWindow = this;
            Navigation.NextPage(new PageComponent("Авторизация", new AuthorizationPage()));
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            
            Navigation.BackPage();
        }

        private void StudentListMWbtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Список студентов", new StudentListPage()));
        }

        private void EmListMWbtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Список сотрудников", new EmployeeListPage()));

        }

        private void ExamListMWbtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Список экзаменов", new ExamListPage()));
        }

        private void DisciplineListMWbtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Список дисциплин", new DisciplinePage()));

        }

        private void ExitBtn_Click_1(object sender, RoutedEventArgs e)
        {
            App.isAdmin = false;
            Navigation.ClearHistory();
            Navigation.NextPage(new PageComponent("Авторизация", new AuthorizationPage()));
        }
    }
}
