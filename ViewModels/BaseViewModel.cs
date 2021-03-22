using System.ComponentModel;
using System.Windows;

namespace DemEkzDemo.ViewModels
{
    public class BaseViewModel : DependencyObject, INotifyPropertyChanged 
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}