using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using DemEkzDemo.ModelDb;

namespace DemEkzDemo.ViewModels
{
    public class MainMenuViewModel : BaseViewModel
    {
        public MainMenuViewModel(MainWindowViewModel mainWindowViewModel)
        {
            this.mainWindowViewModel = mainWindowViewModel;

            InitColors();
            Connection();
            InitCommands();
        }
       
        #region Fields

        public readonly MainWindowViewModel mainWindowViewModel;
        private DemServerEntities db = new DemServerEntities();
        private bool prevPage = false;

        public DemServerEntities Db
        {
            get
            {
                return db;
            }
            set
            {
                db = value;
                OnPropertyChanged(nameof(Db));
            }
        }

        private SolidColorBrush additionallyGridBackground;
        public SolidColorBrush AdditionallyGridBackground
        {
            get { return additionallyGridBackground; }
            set { additionallyGridBackground = value; OnPropertyChanged(nameof(AdditionallyGridBackground)); }
        }

        private SolidColorBrush mainGridBackground;
        public SolidColorBrush MainGridBackground
        {
            get { return mainGridBackground; }
            set { mainGridBackground = value; OnPropertyChanged(nameof(MainGridBackground)); }
        }

        private SolidColorBrush focusGridBackground;
        public SolidColorBrush FocusGridBackground
        {
            get { return focusGridBackground; }
            set { focusGridBackground = value; OnPropertyChanged(nameof(FocusGridBackground)); }
        }

        private int size;
        public int Size
        {
            get { return size; }
            set { size = value; OnPropertyChanged(nameof(Size)); }
        }

        private int perPage = 10;
        public int PerPage
        {
            get { return perPage; }
            set { perPage = value; OnPropertyChanged(nameof(PerPage)); }
        }

        private int count = 0;
        public int Count
        {
            get { return count; }
            set { count = value; OnPropertyChanged(nameof(Count)); }
        }

        private IEnumerable listClients;
        public IEnumerable ListClients
        {
            get { return listClients; }
            set { listClients = value; OnPropertyChanged(nameof(ListClients)); }
        }

        private int genderFilterIndex;
        public int GenderFilterIndex
        {
            get { return genderFilterIndex; }
            set 
            {
                genderFilterIndex = value;
                Count = 0;
                LoggedOut = PerPage;
                CheckLoggedOut();
                Connection();
                OnPropertyChanged(nameof(GenderFilterIndex));
            }
        }

        private int loggedOut = 10;
        public int LoggedOut
        {
            get { return loggedOut; }
            set { loggedOut = value; OnPropertyChanged(nameof(LoggedOut)); }
        }

        private string filterClient;
        public string FilterClient
        {
            get { return filterClient; }
            set 
            {
                filterClient = value;
                Connection();
                OnPropertyChanged(nameof(FilterClient));
            }
        }

        #endregion

        #region Methods

        private bool CheckConnection()
        {
            if (db != null)
            {
                return true;
            }
            else return false;
        }
        private void Connection()
        {
            if (CheckConnection())
            {
                ListClients = (from f in db.Client_Import_good
                               where (f.Name.Contains(FilterClient) || (f.LastName.Contains(FilterClient) || f.Surname.Contains(FilterClient) || f.Email.Contains(FilterClient) || f.Phone.Contains(FilterClient)))
                               join l in db.Tags
                                 on f.TagID equals l.ID
                                 into m
                               join gen in db.Genders
                               on f.Gender equals gen.Code
                               from mo in m.DefaultIfEmpty()
                               orderby f.ID
                               select new
                               {
                                   Name = f.Name,
                                   ID = f.ID,
                                   Surname = f.Surname,
                                   DateOfBirth = f.DateOfBirth,
                                   Gender = gen.Name,
                                   Email = f.Email,
                                   Phone = f.Phone,
                                   LastName = f.LastName,
                                   Tags = mo.Title,
                                   RegistrationDate = f.RegistrationDate
                               }
                           ).Where(gen => GenderFilterIndex > 0 ? (gen.Gender == "Мужской" && genderFilterIndex == 1) || (gen.Gender == "Женский" && genderFilterIndex == 2) : true)
                           .Skip(Count * PerPage).Take(PerPage)
                           .ToList();
                Size = db.Client_Import_good.Where(gen => GenderFilterIndex > 0 ? (gen.Gender == "м" && genderFilterIndex == 1) || (gen.Gender == "ж" && genderFilterIndex == 2) : true).Count();
            } else
            {
                MessageBox.Show("Connection failed");
            }
        }
        private void InitColors()
        {
            AdditionallyGridBackground = new SolidColorBrush(Color.FromRgb(231, 250, 191));
            MainGridBackground = new SolidColorBrush(Color.FromRgb(255, 255, 255));
            FocusGridBackground = new SolidColorBrush(Color.FromRgb(4, 160, 255));
        }
        private void InitCommands()
        {
            NextPageCommand = new RelayCommand(NextPage, x => true);
            PrevPageCommand = new RelayCommand(PrevPage, x => Count != 0);
            Release10ClientsCommand = new RelayCommand(Release10Clients, x => true);
            Release50ClientsCommand = new RelayCommand(Release50Clients, x => true);
            Release200ClientsCommand = new RelayCommand(Release200Clients, x => true);
            ReleaseAllClientsCommand = new RelayCommand(ReleaseAllClients, x => true);
            GoToAddUserPageCommand = new RelayCommand(GoToAddUserPage, x => true);
        }
        private void GoToAddUserPage()
        {
            mainWindowViewModel.SwitchPage("AddUser");
        }
        private void NextPage()
        {
            prevPage = false;
            Count++;
            LoggedOut += PerPage;
            CheckCount();
            CheckLoggedOut();
            Connection();
        }
        private void PrevPage()
        {
            prevPage = true;
            Count--;
            CheckCount();
            CountingLoggedOut();
            Connection();
        }
        private int CheckCount()
        {
            if (Count <= 0)
            {
                return Count = 0;
            }
            else if (Count >= Size / PerPage)
            {
                return Count = Size / PerPage;
            }
            else return Count;
        }
        private int CheckLoggedOut()
        {
            if (LoggedOut >= Size)
            {
                return LoggedOut = Size;
            }
            else if (Count <= 0)
            {
                return LoggedOut = PerPage;
            }
            else return LoggedOut;
        }
        private void CountingLoggedOut() // TODO: ИСПРАВИТЬ!!!
        {
            if (Size == LoggedOut && prevPage)
            {
                LoggedOut -= Size % PerPage;
            }
            else
            {
                LoggedOut -= PerPage;
            }
            CheckLoggedOut();
        } 
        public void Release10Clients()
        {
            Count = 0;
            PerPage = 10;
            LoggedOut = PerPage;
            Connection();
            CheckLoggedOut();
        }
        private void Release50Clients()
        {
            Count = 0;
            PerPage = 50;
            LoggedOut = PerPage;
            Connection();
            CheckLoggedOut();
        }
        private void Release200Clients()
        {
            Count = 0;
            PerPage = 200;
            LoggedOut = PerPage;
            Connection();
            CheckLoggedOut();
        }
        private void ReleaseAllClients()
        {
            Count = 0;
            PerPage = Size + 1;
            LoggedOut = PerPage;
            Connection();
            CheckLoggedOut();
        }
        #endregion

        #region Commands

        public ICommand NextPageCommand { get; set; }
        public ICommand PrevPageCommand { get; set; }
        public ICommand Release10ClientsCommand { get; set; }
        public ICommand Release50ClientsCommand { get; set; }
        public ICommand Release200ClientsCommand { get; set; }
        public ICommand ReleaseAllClientsCommand { get; set; }
        public ICommand GoToAddUserPageCommand { get; set; }

        #endregion


        #region Training

        #endregion
    }
}
