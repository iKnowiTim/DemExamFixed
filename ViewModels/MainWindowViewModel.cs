using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemEkzDemo.ViewModels
{
    public class MainWindowViewModel : BaseViewModel
    {
        public MainWindowViewModel()
        {
            InitPages();
        }


        #region Methods

        private void InitPages()
        {
            mainMenu = new MainMenuViewModel(this);
            managerView = new ManagerAddUserViewModel(mainMenu);
            CurrentPage = mainMenu;
        }
        public void SwitchPage(string namePage)
        {
            switch (namePage)
            {
                case "Menu":
                    CurrentPage = mainMenu;
                    break;
                case "AddUser":
                    CurrentPage = managerView;
                    break;
                default:
                    break;
            }
        }

        #endregion


        #region Fields

        private MainMenuViewModel mainMenu;
        private ManagerAddUserViewModel managerView;

        private BaseViewModel currentPage;
        public BaseViewModel CurrentPage
        {
            get { return currentPage; }
            set { currentPage = value; OnPropertyChanged(nameof(CurrentPage)); }
        }

        #endregion
    }
}
