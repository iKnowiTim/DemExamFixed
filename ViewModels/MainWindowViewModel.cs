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
            CurrentPage = mainMenu;
        }

        #endregion


        #region Fields

        private MainMenuViewModel mainMenu;

        private BaseViewModel currentPage;
        public BaseViewModel CurrentPage
        {
            get { return currentPage; }
            set { currentPage = value; OnPropertyChanged(nameof(CurrentPage)); }
        }




        #endregion
    }
}
