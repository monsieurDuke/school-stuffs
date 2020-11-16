using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace MRTticketing
{
    public partial class MCash : Form
    {
        public MCash(int Substracted_, int Pre_Substract, string Phone_Login_Acc)
        {
            InitializeComponent();
            BT_Topup.Enabled = false;
            BT_Topup.BackColor = Color.Gainsboro;
            for (int i = 0; i < Nominal_Array.Length; i++)
            {
                for (int j = 0; j < Nominal_Array.Length-1; j++)
                {
                    if (Nominal_Array[j] > Nominal_Array[j+1])
                    {
                        int temp;
                        temp = Nominal_Array[j + 1];
                        Nominal_Array[j + 1] = Nominal_Array[j];
                        Nominal_Array[j] = temp;
                    }
                }
            }
            for (int j = 0; j < Nominal_Array.Length; j++)
            {
                CB_Nominal_List.Items.Add(Nominal_Array[j] + ".000,00");
            }
            FileStream fs = new FileStream(Phone_Login_Acc + "_cash.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            Scan = sr.ReadToEnd(); //baca semua
            Amount_Reader = Scan.Split(split3); //split, dimasukin ke string array
            sr.Close(); //close
            fs.Close();
            Amount_cash = TB_Amount.Text.Split(split2);
            Current_Amount = Convert.ToInt32(Amount_cash[0]);
            Total_Current = Convert.ToInt32(Amount_Reader[0]);//Pre_Substract;// - Substracted_;
            TB_Amount.Text = Total_Current + ".000,00";
            Pass_Current = Total_Current;
            Phone_Login = Phone_Login_Acc;
            TB_Phone_Topup.Text = Phone_Login;

            FileStream fs0 = new FileStream(Phone_Login + "_counterTopup.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr0 = new StreamReader(fs0);
            Scan2 = sr0.ReadToEnd();
            Topup_Reader = Scan2.Split(split3);
            sr0.Close();
            fs0.Close();
            counter = Convert.ToInt32(Topup_Reader[0]);

            //FileStream fs2 = new FileStream(Phone_Login + "_profile.txt", FileMode.Open, FileAccess.Read);
            //StreamReader sr2 = new StreamReader(fs2);
            //take_phone = sr2.ReadToEnd();
            //ok3 = take_phone.Split(split4);
            //sr2.Close();
            //fs2.Close();
            //take_phone_again = ok3[]

            Form1 f1 = new Form1(Phone_Login);
        }
        int counter;
        int[] Nominal_Array = new int[] { 50, 100, 20, 150, 250, 5, 10, 500 };
        string Date_Valid, Code1, Code2, Code3, Union, Scan, Scan2;
        string[] ok, Amount_cash, Amount_topup, Amount_Reader, Topup_Reader;
        char[] split = { '-' };
        char[] split3 = { ' ' };
        char[] split4 = { '\n' };
        string take_phone, take_phone_again;

        private void CB_Nominal_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            Access();
        }

        string[] ok3;

        private void BT_Topup_History_Click(object sender, EventArgs e)
        {
            Topup_History f7 = new Topup_History(Phone_Login);
            f7.Show();
        }

        private void BT_Profile_Click(object sender, EventArgs e)
        {
            frmProfile f3 = new frmProfile(Phone_Login);
            f3.Show();
            this.Hide();
        }

        string Phone_Login;
        private void BT_History_Click(object sender, EventArgs e)
        {
            History f2 = new History(Phone_Login);
            f2.Show();
            this.Hide();
        }

        char[] split2 = { '.' };
        int Current_Amount, Total_Current, Update_topup, Pass_Current;
        string Take_Nominal, Take_Topup, Valid2_Now;

        DateTime date = DateTime.Now;
        private void BT_Booking_Click(object sender, EventArgs e)
        {
            Form1 f1 = new Form1(Phone_Login);
            f1.Show();
            this.Hide();
        }

        public void Access()
        {
            if (CB_Nominal_List.SelectedIndex > -1)
            {
                BT_Topup.Enabled = true;
                BT_Topup.BackColor = Color.Honeydew;
            }
        }

        private void BT_Topup_Click(object sender, EventArgs e)
        {
            FileStream fs3 = new FileStream(Phone_Login + "_cash.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr3 = new StreamReader(fs3);
            Scan = sr3.ReadToEnd();
            Amount_Reader = Scan.Split(split3);
            sr3.Close();
            fs3.Close();
            Amount_cash = TB_Amount.Text.Split(split2);
            Current_Amount = Convert.ToInt32(Amount_cash[0]);
            Total_Current = Convert.ToInt32(Amount_Reader[0]);//Pre_Substract;// - Substracted_;
            Pass_Current = Total_Current;
            Valid2_Now = DateTime.Now.ToString(" HH:mm:ss");
            File.WriteAllText(Phone_Login + "_cash.txt", String.Empty);
            //BT_Topup.Enabled = false;
            //CB_Nominal_List.Enabled = false;
            //BT_Topup.BackColor = Color.Gainsboro;
            Date_Valid = date.ToString("dd-MM-yyyy");
            TB_Info.Text = "YOUR M - CASH HAVE SUCCESSFULLY TOP-UP TO YOUR ACCOUNT. SEE THE HISTORY TO SEE THE DETAIL OF THE PAYMENT";
            //FileStream fs2 = new FileStream("variabel_topup.txt", FileMode.Open, FileAccess.Read);
            //StreamReader sr2 = new StreamReader(fs2);
            //Take_Topup = sr2.ReadToEnd();

            var id = Guid.NewGuid().ToString();
            ok = id.Split(split);
            Code1 = ok[0].ToUpper();
            Code2 = ok[2].ToUpper();
            Code3 = ok[3].ToUpper();
            Union = Code1 + " - " + Code2 + " - " + Code3;
            TB_Code.Text = Union;
            if (CB_Nominal_List.SelectedIndex > -1)
            {
                TB_Total.Text = CB_Nominal_List.Items[CB_Nominal_List.SelectedIndex].ToString();
                Take_Nominal = CB_Nominal_List.Items[CB_Nominal_List.SelectedIndex].ToString();
                Amount_topup = Take_Nominal.Split(split2);
                Update_topup = Convert.ToInt32(Amount_topup[0]);
                Update_topup = Update_topup + Pass_Current;
                TB_Amount.Text = Convert.ToString(Update_topup) + ".000,00";
                File.WriteAllText(Phone_Login + "_cash.txt", String.Empty);
                FileStream fs = new FileStream(Phone_Login + "_cash.txt", FileMode.Append, FileAccess.Write);
                StreamWriter sr = new StreamWriter(fs);
                sr.WriteLine(Update_topup);
                sr.Flush();
                sr.Close();
                fs.Close();
            }
            else
            {
                TB_Total.Text = CB_Nominal_List.Text;
                Take_Nominal = CB_Nominal_List.Text;
                Amount_topup = Take_Nominal.Split(split2);
                Update_topup = Convert.ToInt32(Amount_topup[0]);
                Update_topup = Update_topup + Pass_Current;
                TB_Amount.Text = Convert.ToString(Update_topup) + ".000,00";
                File.WriteAllText(Phone_Login + "_cash.txt", String.Empty);
                FileStream fs = new FileStream(Phone_Login + "_cash.txt", FileMode.Append, FileAccess.Write);
                StreamWriter sr = new StreamWriter(fs);
                sr.WriteLine(Update_topup);
                sr.Flush();
                sr.Close();
                fs.Close();
            }

            FileStream fs2 = new FileStream(Phone_Login + "_topup.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sr2 = new StreamWriter(fs2);
            sr2.WriteLine(Take_Nominal + "#" + Union + "#" + Date_Valid + " ("+Valid2_Now+")" + "#");
            sr2.Flush();
            sr2.Close();
            fs2.Close();

            File.WriteAllText(Phone_Login + "_checkTopup.txt", String.Empty);
            FileStream fp = new FileStream(Phone_Login + "_checkTopup.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sp = new StreamWriter(fp);
            sp.WriteLine("1");
            sp.Flush();
            sp.Close();
            fp.Close();

            File.WriteAllText(Phone_Login + "_counterTopup.txt", String.Empty);
            FileStream fs8 = new FileStream(Phone_Login + "_counterTopup.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sr8 = new StreamWriter(fs8);
            sr8.WriteLine(counter++);
            sr8.Flush();
            sr8.Close();
            fs8.Close();

        }
    }
}
