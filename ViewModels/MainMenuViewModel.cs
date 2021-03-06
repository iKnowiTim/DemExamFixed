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
using DemEkzDemo.Model;
using System.Collections.ObjectModel;

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

        private ObservableCollection<DemEkzDemo.Model.Client> listClients;
        public ObservableCollection<DemEkzDemo.Model.Client> ListClients
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

        private bool filterClientVis = true;
        public bool FilterClientVis
        {
            get { return filterClientVis; }
            set { filterClientVis = value; OnPropertyChanged(nameof(FilterClientVis)); }
        }

        private bool editUserVis = false;
        public bool EditUserVis
        {
            get { return editUserVis; }
            set { editUserVis = value; OnPropertyChanged(nameof(EditUserVis)); }
        }

        private Model.Client selectedItem;
        public Model.Client SelectedItem
        {
            get { return selectedItem; }
            set
            {
                selectedItem = value;
                OnPropertyChanged(nameof(SelectedItem));
            }
        }

        private string clientPhoto;
        public string ClientPhoto
        {
            get { return clientPhoto; }
            set
            {
                clientPhoto = value;
                OnPropertyChanged(nameof(ClientPhoto));
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
                ListClients = new ObservableCollection<Model.Client>((from f in db.Client_Import_good
                                                                      where (f.Name.Contains(FilterClient) || (f.LastName.Contains(FilterClient) || f.Surname.Contains(FilterClient) || f.Email.Contains(FilterClient) || f.Phone.Contains(FilterClient)))
                                                                      join l in db.Tags
                                                                        on f.TagID equals l.ID
                                                                        into m
                                                                      join gen in db.Genders
                                                                      on f.Gender equals gen.Code
                                                                      from mo in m.DefaultIfEmpty()
                                                                      orderby f.ID
                                                                      select new DemEkzDemo.Model.Client
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
                                                                          RegistrationDate = f.RegistrationDate,
                                                                          ClientPhoto = f.ClientPhoto
                                                                      }
                           ).Where(gen => GenderFilterIndex > 0 ? (gen.Gender == "Мужской" && genderFilterIndex == 1) || (gen.Gender == "Женский" && genderFilterIndex == 2) : true)
                           .Skip(Count * PerPage).Take(PerPage).ToList());
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
            VisEditModeUserCommand = new RelayCommand(VisEditModeUser, x => true);
            VisSerachClientsCommand = new RelayCommand(VisSerachClients, x => true);
            DeleteClientCommand = new RelayCommand(DeleteClient, x => SelectedItem != null);
            EditClientCommand = new RelayCommand(EditClient, CanExecuteEditClient);
        }
        private bool CanExecuteEditClient(object arg)
        {
            return SelectedItem != null && SelectedItem.Name.Length > 0 && SelectedItem.Name.Length < 50 && SelectedItem.LastName.Length > 0 &&
                SelectedItem.LastName.Length < 50 && SelectedItem.Surname.Length > 0 && SelectedItem.Surname.Length < 50
                && SelectedItem.Email.Contains("@");
        }
        private void EditClient()
        {
            var client = Db.Client_Import_good.Where(a => a.ID == SelectedItem.ID)
                .FirstOrDefault();
            client.Name = SelectedItem.Name;
            client.LastName = SelectedItem.LastName;
            client.Surname = SelectedItem.Surname;
            client.Phone = SelectedItem.Phone;
            client.DateOfBirth = SelectedItem.DateOfBirth;
            client.Email = SelectedItem.Email;
            if (SelectedItem.Gender == "Женский")
            {
                client.Gender = "ж";
            }
            else
            {
                client.Gender = "м";
            }

            Db.SaveChanges();
            Connection();
            SelectedItem = null;
            MessageBox.Show("Успешно изменено");
        }
        private void DeleteClient()
        {
            var client = db.Client_Import_good
                .Where(a => a.ID == SelectedItem.ID)
                .FirstOrDefault();
            db.Client_Import_good.Remove(client);
            db.SaveChanges();
            Connection();
            MessageBox.Show("Клиент удален");
        }
        private void VisSerachClients()
        {
            EditUserVis = false;
            FilterClientVis = true;
        }
        private void VisEditModeUser()
        {
            EditUserVis = true;
            FilterClientVis = false;
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
        public ICommand VisEditModeUserCommand { get; set; }
        public ICommand VisSerachClientsCommand {get;set;}
        public ICommand DeleteClientCommand { get; set; }
        public ICommand EditClientCommand { get; set; }

        #endregion


        #region Training

        #endregion
    }
}
