   M S B A M L   `   `   `  ����D  @FTPUpload, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:FTPUpload	FTPUpload  5   	       FTPUpload.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:FTPUpload     5   	   V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	    � Title$ 	FTPUpload��5   	   $	��800��5   	   $	��600��5   	    � 
ResizeMode$ CanMinimize=�5   	    � WindowStartupLocation$ CenterScreen=�5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      6!   �� 5      6!   �� 5      6!    � RowDefinitions 5   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6   .+�5!   
   '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Upload=�6"   $	��100��5"   "   $	��100��5#   "   
����p��$��Center=�5%   "   $��Center=�5&   "   $��1��5'   "   �� 5)   
    �� Orientation$ Vertical=�6   $��Center=�5*      $	��Top=�5+      $��3��5,      $��3��5-      $��1��5.      .+�50      �� $ 
Horizontal=�6   .+�51      �� -   5        	 ��Name$	 
txtFtpLink��51       (  $MaterialDesignFilledTextFieldTextBox#��[  52      $	��300��53      )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Link do FTP��54      $'��!ftp://seuftpaqui.com.br (Exemplo)��55      $��5q�56      $��1��57      �� 59      -   5        $	 txtFtpPasta��59      #��[  5:      $	��300��5;      $
 Local da pasta��5<      $&�� /public_html/arquivos/ (Exemplo)��5=      $��5q�5>      $��2��5?      5A      �� 5C      -   5        $	 
txtFtpUser��5C      #��[  5D      $
 Usuário��5E      $	��610��5F      $��5q�5G      $��3��5H      G� 5J      -   5         G�Name$ 
txtFtpPass��5J      $	��610��5K       0 ,MaterialDesignFilledPasswordFieldPasswordBox#��[ 5L      $
 Senha��5M      $��5q�5N      $��4��5O      5P      �� 5R   
   $ 
Horizontal=�6   $��Center=�5S      $��Center=�5T      $��3��5U      $��3��5V      .+�5X      �� -   5        $	 
txtArquivo��5X      $	��500��5Y      $��30��5Z      $��5q�5[      $7
 1Selecione o arquivo a ser enviado para o servidor��5\      {�.  $
��Bold"�5^      �� 5`      -   5         ��Name$ btnPesquisar��5`      $	��100��5a      $��Procurar��5b      $��5q�5c       � ToolTip$B <Selecione o arquivo que irá ser enviado para o servidor FTP��5d      $��5��5e      5f      5h      �� 5j   
   $ Vertical=�6   $��4��5k      $��0��5l      $��3��5m      $��Bottom=�5n      $��5q�5o      .+�5q      � -   5         �Name$ 	pgbStatus��5q      $	��610��5r       � Minimum$ 0Q�5u      $��20��5v      ;  5MaterialDesignThemes.Wpf.Transitions.TransitionAssist   DisableTransitions . $��1��5x      $��2��5y      $y�	Collapsed=�5z      ���	#FF9C99DC���	#FF6F569C � Maximum 5s      �� *Maximo+ � Value 5t      �� *
ValorAtual+5{   1   �� 5}      -   5         ��Name$ txtProgresso��5}      $��Center=�5      $��Center=�5�       J� Opacity$	 0.5Q�5�      ��5~      ��  �� ElementName$ 	pgbStatus�� �� Path$ Value� �� StringFormat$ {0:0}%��5�      5�      �� 5�   
   $ 
Horizontal=�6   $��Center=�5�      $	��Top=�5�      $��5q�5�      $��4��5�      $��3��5�      .+�5�      �� -	   5        $ 	btnEnviar��5�      $��Enviar��5�      $	��200��5�      $) #Envia o arquivo para o servidor FTP��5�      $��5q�5�       �� 	IsDefault . $��6��5�      �� 5�      -
   5        $ 	btnLimpar��5�      $��Limpar��5�      $	��200��5�      $* $Limpa todos os campos da aplicação��5�      $��5q�5�      $��7��5�      5�      5�      5�      5�      