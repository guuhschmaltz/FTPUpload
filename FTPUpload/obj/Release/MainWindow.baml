   M S B A M L   `   `   `  ���� D  @FTPUpload, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:FTPUpload	FTPUpload      FTPUpload.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     )localclr-namespace:FTPUpload     V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=� � Title$ 	FTPUpload��$	��800��$	��600�� � 
ResizeMode$ CanMinimize=� � WindowStartupLocation$ CenterScreen=�.���  � ColumnDefinitions �� �� ��  � RowDefinitions �� �� �� �� �� .+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Upload=�$	��100��$	��100��
����p��$��Center=�$��Center=�$��1����  �� Orientation$ Vertical=�$��Center=�$	��Top=�$��3��$��3��$��1��.+��� $ 
Horizontal=�.+��� -   	 ��Name$	 
txtFtpLink�� (  $MaterialDesignFilledTextFieldTextBox#��[  $	��300��)  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Link do FTP��$'��!ftp://seuftpaqui.com.br (Exemplo)��$��5q�$��1���� -   $	 txtFtpPasta��#��[  $	��300��$
 Local da pasta��$&�� /public_html/arquivos/ (Exemplo)��$��5q�$��2���� -   $	 
txtFtpUser��#��[  $
 Usuário��$	��610��$��5q�$��3��G� -    G�Name$ 
txtFtpPass��$	��610�� 0 ,MaterialDesignFilledPasswordFieldPasswordBox#��[ $
 Senha��$��5q�$��4���� $ 
Horizontal=�$��Center=�$��Center=�$��3��$��3��.+��� -   $	 
txtArquivo��$	��500��$��30��$��5q�$7
 1Selecione o arquivo a ser enviado para o servidor��{�.  $
��Bold"��� -    ��Name$ btnPesquisar��$	��100��$��Procurar��$��5q� � ToolTip$B <Selecione o arquivo que irá ser enviado para o servidor FTP��$��5���� $ Vertical=�$��4��$��0��$��3��$��Bottom=�$��5q�.+�� -    �Name$ 	pgbStatus��$	��610�� � Minimum$ 0Q�$��20��;  5MaterialDesignThemes.Wpf.Transitions.TransitionAssist   DisableTransitions . $��1��$��2��$y�	Collapsed=����	#FF9C99DC���	#FF6F569C � Maximum �� *Maximo+ � Value �� *
ValorAtual+�� -    ��Name$ txtProgresso��$��Center=�$��Center=� J� Opacity$	 0.5Q�����  �� ElementName$ 	pgbStatus�� �� Path$ Value� �� StringFormat$ {0:0}%���� $ 
Horizontal=�$��Center=�$	��Top=�$��5q�$��4��$��3��.+��� -	   $ 	btnEnviar��$��Enviar��$	��200��$) #Envia o arquivo para o servidor FTP��$��5q� �� 	IsDefault . $��6���� -
   $ 	btnLimpar��$��Limpar��$	��200��$* $Limpa todos os campos da aplicação��$��5q�$��7��