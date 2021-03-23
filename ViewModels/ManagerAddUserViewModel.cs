using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using DemEkzDemo.ModelDb;
using System.Windows.Input;
using System.Windows.Media;

namespace DemEkzDemo.ViewModels
{
    public class ManagerAddUserViewModel : BaseViewModel
    {
        private readonly MainMenuViewModel mainMenuViewModel;

        public ManagerAddUserViewModel(MainMenuViewModel mainMenuViewModel)
        {
            this.mainMenuViewModel = mainMenuViewModel;
            InitCommands();
        }

        #region Methods

        private void InitCommands()
        {
            GoToMainMenuCommand = new RelayCommand(GoToMainMenu, x => true);
            AddUserCommand = new RelayCommand(AddUser, CanExecuteAddUser);
        }
        private bool CanExecuteAddUser(object arg)
        {
            return Name.Length > 0 && Name.Length < 50 && LastName.Length > 0 && LastName.Length < 50 && Surname.Length > 0 && Surname.Length < 50
                && (Email.Contains("@mail") || Email.Contains("@Gmail")) && ((Email.Contains("ru") || Email.Contains("com")));
        }
        private void AddUser()
        {
            Client_Import_good client = new Client_Import_good()
            {
                Name = Name,
                LastName = LastName,
                Surname = Surname,
                Gender = GenderCheck(),
                ClientPhoto = "Клиенты/44.jpg",
                DateOfBirth = DateOfBirth,
                RegistrationDate = DateTime.Now,
                Email = Email,
                Phone = Phone                
            };

            mainMenuViewModel.Db.Client_Import_good.Add(client);
            mainMenuViewModel.Db.SaveChanges();

            MessageBox.Show("Пользователь добавлен!");
            mainMenuViewModel.Release10Clients();
            mainMenuViewModel.mainWindowViewModel.SwitchPage("Menu");
        }
        private void GoToMainMenu()
        {
            mainMenuViewModel.mainWindowViewModel.SwitchPage("Menu");
        }
        private string GenderCheck()
        {
            if (Gender == 0)
            {
                return "м";
            }
            else return "ж";
        }

        #endregion

        #region Fields

        private string name = "fsdfsdf";
        public string Name
        {
            get { return name; }
            set { name = value; OnPropertyChanged(nameof(Name)); }
        }

        private string lastName = "sdfsdf";
        public string LastName
        {
            get { return lastName; }
            set { lastName = value; OnPropertyChanged(nameof(LastName)); }
        }

        private string surname = "sdfsdf";
        public string Surname
        {
            get { return surname; }
            set { surname = value; OnPropertyChanged(nameof(Surname)); }
        }

        private int gender = 0;
        public int Gender
        {
            get { return gender; }
            set { gender = value; OnPropertyChanged(nameof(Gender)); }
        }

        private string phone = "45465454";
        public string Phone
        {
            get { return phone; }
            set { phone = value; OnPropertyChanged(nameof(Phone)); }
        }

        private string email = "asdasd";
        public string Email
        {
            get { return email; }
            set { email = value; OnPropertyChanged(nameof(Email)); }
        }

        private DateTime dateOfBirth = DateTime.Now;
        public DateTime DateOfBirth
        {
            get { return dateOfBirth; }
            set { dateOfBirth = value; OnPropertyChanged(nameof(DateOfBirth)); }
        }

        public SolidColorBrush AdditionallyGridBackground;

        #endregion

        #region Commands

        public ICommand GoToMainMenuCommand { get; set; }
        public ICommand AddUserCommand { get; set; }

        #endregion
    }
}
