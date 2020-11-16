using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace MRTticketing
{
    public partial class frmProfile : Form
    {
        public frmProfile(string Phone_Number_Acc)
        {
            InitializeComponent();
            Phone_Login = Phone_Number_Acc;
            FileStream fs = new FileStream(Phone_Login + "_profile.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            Passing = sr.ReadToEnd();
            Passing_Arr = Passing.Split(Delimiter);
            sr.Close();
            fs.Close();
            TB_Nama.Text = Passing_Arr[0];
            TB_ID_Type.Text = Passing_Arr[1];
            TB_ID_Number.Text = Passing_Arr[2];
            TB_Phone_Number.Text = Passing_Arr[3];
            TB_Date_Birth.Text = Passing_Arr[4] + " " + Passing_Arr[5] + " " + Passing_Arr[6];
            TB_Place_Birth.Text = Passing_Arr[7];
            TB_Password.Text = Passing_Arr[8];
        }
        string Phone_Login;
        string Passing;
        string[] Passing_Arr;
        char[] Delimiter = { '\n' };
        int a, b;
        private void BT_Logout_Click(object sender, EventArgs e)
        {
            frmLogin f1 = new frmLogin();
            f1.Show();
            this.Hide();
        }

        private void BT_Booking_Click(object sender, EventArgs e)
        {
            Form1 f2 = new Form1(Phone_Login);
            f2.Show();
            this.Hide();
        }

        private void BT_History_Click(object sender, EventArgs e)
        {
            History f4 = new History(Phone_Login);
            f4.Show();
            this.Hide();
        }

        private void BT_MCash_Click(object sender, EventArgs e)
        {
            MCash f3 = new MCash(a, b, Phone_Login);
            f3.Show();
            this.Hide();
        }
    }
}
