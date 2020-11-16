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
    public partial class Topup_History : Form
    {
        public Topup_History(string Phone_Login_Acc)
        {
            InitializeComponent();
            FileStream fs = new FileStream(Phone_Login_Acc + "_cash.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            Scan = sr.ReadToEnd();
            Amount_Reader = Scan.Split(Deli_Space);
            sr.Close();
            fs.Close();

            FileStream fs2 = new FileStream(Phone_Login_Acc + "_topup.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr2 = new StreamReader(fs2);
            Scan3 = sr2.ReadToEnd();
            Topup_List = Scan3.Split(Deli_Space);
            sr2.Close();
            fs2.Close();

            FileStream fs8 = new FileStream(Phone_Login_Acc + "_counterTopup.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr8 = new StreamReader(fs8);
            Scan4 = sr8.ReadToEnd();
            check_counter = Scan4.Split(Deli_Space);
            sr8.Close();
            fs8.Close();
            counter = Convert.ToInt32(check_counter[0]);
            inc = counter;
            counter2 = inc;

            FileStream fp = new FileStream(Phone_Login_Acc + "_checkTopup.txt", FileMode.Open, FileAccess.Read);
            StreamReader sp = new StreamReader(fp);
            Scan2 = sp.ReadToEnd();
            check_arr = Scan2.Split(Deli_Space);
            check_payment = check_arr[0];
            sp.Close();
            fp.Close();
            if (check_payment.ToString().ToLower().Trim() == "1")
            {
                BT_Search.Visible = true;
                BT_Next.Visible = true;
                BT_Back.Visible = true;
            }
            else
            {
                BT_Search.Visible = false;
                BT_Next.Visible = false;
                BT_Back.Visible = false;
            }
        }
        int counter, fake_counter, inc, counter2;
        string Scan, Scan2, Scan3, Scan4, check_payment, pass_counter, bypass, cash_updt;

        private void BT_Next_Click(object sender, EventArgs e)
        {
            if (counter < inc)
            {
                counter++;
                counter2++;
                Placing();
            }
            else
            {
                counter = 0;
                counter2 = 0;
                Placing();
            }
        }

        private void BT_Back_Click(object sender, EventArgs e)
        {
            if (counter > 0)
            {
                counter--;
                counter2--;
                Placing();
            }
            else
            {
                counter = inc;
                counter2 = inc;
                Placing();
            }
        }

        private void BT_Search_Click(object sender, EventArgs e)
        {
            Placing();
        }

        string[] Amount_Reader, check_arr, Topup_List, check_counter;
        string[] Topup2_List;
        char[] Deli_Space = { '\n' };
        char[] Deli_Hashtg = { '#' };

        //5.000,00#5132D27F - 48DE - A1BA#22-06-2019#
        public void Placing()
        {
            cash_updt = Amount_Reader[0] + ".000,00";
            fake_counter = counter;
            pass_counter = Topup_List[counter];
            bypass = pass_counter;
            Topup2_List = bypass.Split(Deli_Hashtg);
            //TB_Cash_Update.Text = bypass;
            TB_Nominal_Topup.Text = Topup2_List[0];
            TB_Code.Text = Topup2_List[1];
            TB_Payment.Text = Topup2_List[2];
            TB_Counter.Text = Convert.ToString(++fake_counter);
            TB_Cash_Update.Text = cash_updt;
        }
    }
}
