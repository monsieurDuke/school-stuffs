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
    public partial class History : Form
    {
        public History(string Phone_Login_Acc)
        {
            InitializeComponent();
            Phone_Login = Phone_Login_Acc;
            FileStream fs = new FileStream(Phone_Login+"_booking.txt", FileMode.Open, FileAccess.Read);
            StreamReader sw = new StreamReader(fs);
            Read = sw.ReadToEnd();
            //TB_History.Text = Read;
            Passing_1 = Read.Split(Deli_Space);
            sw.Close();
            fs.Close();
            //Read_PerLine = Passing_1[counter];
            //Passing_2 = Read_PerLine.Split(Deli_Hash);
            //Placing();
            FileStream fs8 = new FileStream(Phone_Login + "_counter.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr8 = new StreamReader(fs8);
            pass_counter = sr8.ReadToEnd();
            keeper_counter = pass_counter.Split(Deli_Space);
            sr8.Close();
            fs8.Close();
            inc_ = Convert.ToInt32(keeper_counter[0]);
            booking_counter = inc_;
            counter = booking_counter;
            //pass_checking = false;
            //if (pass_checking == true)
            //{
            //    BT_Search.Visible = true;
            //    BT_Next.Visible = true;
            //    BT_Back.Visible = true;
            //}

            FileStream fp = new FileStream(Phone_Login + "_checkHistory.txt", FileMode.Open, FileAccess.Read);
            StreamReader sp = new StreamReader(fp);
            pass_check_book = sp.ReadToEnd();
            check_arr = pass_check_book.Split(Deli_Blank);
            check_booking = check_arr[0];
            if (check_booking.ToString().ToLower().Trim() == "1")
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
        //bool pass_checking;
        string pass_counter, pass_check_book, check_booking;
        string[] keeper_counter, check_arr;
        int inc_;
        char[] Deli_Blank = { ' ' };
        public void Placing()
        {
            //if (counter > inc_)
            //{
            //    counter = -1;
            //    booking_counter = 0;
            //}
            //else
            //{
            Read_PerLine = Passing_1[booking_counter];
            Passing_2 = Read_PerLine.Split(Deli_Hash);
            TB_Code.Text = Passing_2[1];
            TB_Booking.Text = Passing_2[2];
            TB_Valid.Text = Passing_2[3];
            TB_Origin.Text = Passing_2[4];
            TB_Destination.Text = Passing_2[5];
            TB_Passenger.Text = Passing_2[6];
            TB_Time_Distance.Text = Passing_2[7] + " ( " + Passing_2[8] + " )";
            TB_Tot_Price.Text = Passing_2[9];
            TB_Price.Text = Passing_2[10];
            TB_M_Cash.Text = Passing_2[9];
            TB_Substract.Text = Passing_2[9];
            TB_Counter.Text = Convert.ToString(booking_counter);
            //}
        }
        int a, b, counter, booking_counter;
        string Phone_Login, Read, Read_PerLine;
        string[] Passing_1, Passing_2;
        char[] Deli_Space = { '\n' };
        char[] Deli_Hash = { '#' };

        private void BT_Search_Click(object sender, EventArgs e)
        {
            Placing();
            BT_Search.Enabled = false;
            BT_Search.BackColor = Color.Gainsboro;
        }

        private void BT_Back_Click(object sender, EventArgs e)
        {
            if (counter > 1)
            {
                counter--;
                booking_counter--;
                Placing();
            }
            else
            {
                counter = inc_;
                booking_counter = inc_;
                Placing();
            }
        }

        private void BT_Next_Click(object sender, EventArgs e)
        {
            if (counter < inc_)
            {
                counter++;
                booking_counter++;
                Placing();
            }
            else
            {
                counter = 1;
                booking_counter = 1;
                Placing();
            }
        }

        private void BT_Booking_Click(object sender, EventArgs e)
        {
            Form1 f1 = new Form1(Phone_Login);
            f1.Show();
            this.Hide();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void BT_Profile_Click(object sender, EventArgs e)
        {
            frmProfile f3 = new frmProfile(Phone_Login);
            f3.Show();
            this.Hide();
        }

        private void BT_MCash_Click(object sender, EventArgs e)
        {
            MCash f2 = new MCash(a,b, Phone_Login);
            f2.Show();
            this.Hide();
        }
    }
}
