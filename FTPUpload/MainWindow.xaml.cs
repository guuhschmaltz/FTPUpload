using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Net;
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

namespace FTPUpload
{
    /// <summary>
    /// Interação lógica para MainWindow.xam
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private double maximo;
        public double Maximo
        {
            get
            {
                return maximo;
            }
            set
            {
                maximo = value;
                OnPropertyChanged("Maximo");
            }
        }

        private double valorAtual;

        public double ValorAtual
        {
            get
            {
                return valorAtual;
            }
            set
            {
                valorAtual = value;
                OnPropertyChanged("ValorAtual");
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        public MainWindow()
        {
            InitializeComponent();
            DataContext = this;
            CleanView();
        }

        private void CleanView()
        {
            btnEnviar.IsEnabled = true;
            btnLimpar.IsEnabled = true;
            pgbStatus.Visibility = Visibility.Hidden;
            txtProgresso.Visibility = Visibility.Hidden;
            txtArquivo.Text = null;
            txtFtpLink.Text = null;
            txtFtpPass.Password = null;
            txtFtpUser.Text = null;
        }

        private void btnPesquisar_Click(object sender, RoutedEventArgs e)
        {
            FileInfo f = null;
            OpenFileDialog dlg;
            dlg = new OpenFileDialog();

            bool? result = dlg.ShowDialog();
            if (result == true)
            {

                f = new FileInfo(dlg.FileName);

                using (Stream s = dlg.OpenFile())

                {

                    TextReader reader = new StreamReader(s);

                    string st = reader.ReadToEnd();

                    txtArquivo.Text = dlg.FileName;

                }

            }
        }

        private async void btnEnviar_Click(object sender, RoutedEventArgs e)
        {
            if (validaInformacao())
            {
                if (!string.IsNullOrEmpty(txtArquivo.Text) || 
                    !string.IsNullOrEmpty(txtFtpUser.Text) || 
                    !string.IsNullOrEmpty(txtFtpPass.Password) || 
                    !string.IsNullOrEmpty(txtFtpLink.Text))
                {
                    pgbStatus.Visibility = Visibility.Visible;
                    txtProgresso.Visibility = Visibility.Visible;
                    btnEnviar.IsEnabled = false;
                    btnLimpar.IsEnabled = false;

                    try
                    {

                        await EnviarArquivoFTP(txtArquivo.Text, txtFtpLink.Text, txtFtpUser.Text, txtFtpPass.Password);
                        MessageBox.Show("Arquivo enviado ao servidor com sucesso!", "FTPUpload", MessageBoxButton.OK, MessageBoxImage.Information);
                    }

                    catch (WebException)
                    {
                        MessageBox.Show("Operação cancelada, verifique sua conexão com a internet e tente novamente.", "FTPUpload", MessageBoxButton.OK, MessageBoxImage.Error);
                    }

                    catch (OperationCanceledException)
                    {
                        MessageBox.Show("Operação cancelada!", "FTPUpload", MessageBoxButton.OK, MessageBoxImage.Error);
                    }

                    catch (Exception ex)
                    {
                        MessageBox.Show($"Erro: {ex.Message}", "FTI", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                    finally
                    {
                        CleanView();
                    }
                }
            }
            else
            {
                MessageBox.Show("Insira o arquivo que deseja enviar ao servidor");
            }
        }
        public async Task EnviarArquivoFTP(string arquivo, string ftplink, string ftpuser, string ftppass)
        {
            try
            {
                await Task.Run(() =>
                {
                    FileInfo arquivoInfo = new FileInfo(arquivo);

                    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftplink);

                    request.Method = WebRequestMethods.Ftp.UploadFile;
                    request.Credentials = new NetworkCredential(ftpuser, ftppass);
                    request.UseBinary = true;
                    request.ContentLength = arquivoInfo.Length;
                    //Maximo = arquivoInfo.Length
                    Maximo = 100;

                    using (FileStream fs = arquivoInfo.OpenRead())
                    {

                        byte[] buffer = new byte[2048];
                        int bytesSent = 0;
                        int bytes = 0;


                        using (Stream stream = request.GetRequestStream())
                        {
                            while (bytesSent < arquivoInfo.Length)
                            {
                                ValorAtual = ((double)bytesSent * 100) / arquivoInfo.Length;
                                bytes = fs.Read(buffer, 0, buffer.Length);
                                stream.Write(buffer, 0, bytes);
                                bytesSent += bytes;
                            }
                        }
                    }
                });
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        private bool validaInformacao()
        {
            if (string.IsNullOrEmpty(txtArquivo.Text))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private void btnLimpar_Click(object sender, RoutedEventArgs e)
        {
            CleanView();
        }
    }
}
