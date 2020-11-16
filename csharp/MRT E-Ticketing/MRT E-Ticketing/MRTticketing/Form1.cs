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
using System.Diagnostics;

namespace MRTticketing
{
    public partial class Form1 : Form
    {
        public Form1(string Phone_Number_Acc)
        {
            InitializeComponent();
            //Setting up length
            BT_Book.Enabled = false;
            BT_Book.BackColor = Color.Gainsboro;
            TB_Adult_Pass.MaxLength = 2;
            TB_Faint_Pass.MaxLength = 2;
            for (int i = 0; i < 13; i++)
            {
                CB_Origin_List.Items.Add(Origin_ArrayList[i]);
                CB_Destination_List.Items.Add(Destination_ArrayList[i]);
            }
            FileStream fs2 = new FileStream(Phone_Number_Acc+"_cash.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr2 = new StreamReader(fs2);
            Cash_Passed = sr2.ReadToEnd();
            Cash_Passed_Arr = Cash_Passed.Split(Deli_Space);
            Saldo = Convert.ToInt32(Cash_Passed_Arr[0]);
            sr2.Close();
            fs2.Close();
            Pass_Substraction = Saldo;
            Phone_Login = Phone_Number_Acc;

            FileStream fs8 = new FileStream(Phone_Number_Acc + "_counter.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr8 = new StreamReader(fs8);
            pass_counter = sr8.ReadToEnd();
            keeper_counter = pass_counter.Split(Deli_Space);
            sr8.Close();
            fs8.Close();
            inc_ = Convert.ToInt32(keeper_counter[0]);

            FileStream f10 = new FileStream("global_counter.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr10 = new StreamReader(f10);
            get_global = sr10.ReadToEnd();
            global_arr = get_global.Split(Deli_Space);
            sr10.Close();
            f10.Close();
            increment_c = Convert.ToInt32(global_arr[0]);
        }

        //Declaring variables and arrays
        string[] Origin_ArrayList = new string[13] { "St Lebak Bulus", "St Fatmawati", "St Cipete Raya", "St Haji Nawi", "St Blok A", "St Blok M", "St ASEAN","St Senayan", "St Istora Mandiri", "St Bendungan Hilir", "St Setia Budi Astra", "St Dukuh Atas BNI", "St Bundaran HI" };
        string[] Destination_ArrayList = new string[13] { "St Lebak Bulus", "St Fatmawati", "St Cipete Raya", "St Haji Nawi", "St Blok A", "St Blok M", "St ASEAN", "St Senayan", "St Istora Mandiri", "St Bendungan Hilir", "St Setia Budi Astra", "St Dukuh Atas BNI", "St Bundaran HI" };
        int[] Origin_KM = new int[13] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11 };
        int[] Destination_KM = new int[13] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11 };
        int[] Origin_Price = new int[13] { 0, 4, 5, 6, 7, 8, 9, 1, 11, 12, 13, 14, 14 };
        int[] Destination_Price = new int[13] { 0, 4, 5, 6, 7, 8, 9, 1, 11, 12, 13, 14, 14 };
        static int Saldo = 500;
        string get_global;
        string[] global_arr;
        int Adult_, Faint_;
        int Time_Counter, Time_Info;
        int Count_Checking_;
        bool Checking_ = false;
        bool Time_Start = false;
        bool Destination_Issue = false, Origin_Issue = false, Pass_Origin = false;
        string Selected_Origin, Selected_Destination;
        string Valid_Now, Valid_End, Valid2_Now, Valid2_End;
        int Pricing, Measuring, Timing, Tot_Pricing, Temp_A_Origin, Temp_A_Destination;
        int Substraction_, Pass_Substraction;
        string Cash_Passed, Coded;
        char[] Deli_Space = { ' ' };
        char[] Deli_Strip = { '-' };
        string[] Cash_Passed_Arr, Code;
        int increment, inc_;
        string pass_counter, Trip_Stats;
        string[] keeper_counter;
        int increment_c;
        private void BT_Profle_Click(object sender, EventArgs e)
        {
            frmProfile f3 = new frmProfile(Phone_Login);
            f3.Show();
            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        string Phone_Login;

        private void TB_Info_TextChanged(object sender, EventArgs e)
        {

        }

        private void BT_MCash_Click(object sender, EventArgs e)
        {
            MCash f1 = new MCash(Substraction_, Pass_Substraction, Phone_Login);
            f1.Show();
            this.Hide();
        }

        private void BT_History_Click(object sender, EventArgs e)
        {
            History f2 = new History(Phone_Login);
            f2.Show();
            this.Hide();
        }

        private void BT_Book_Click(object sender, EventArgs e)
        {
            //
            MessageBoxButtons a = MessageBoxButtons.YesNo;
            DialogResult result3 = MessageBox.Show("You are about to book the ticket(s). Once it's booked, it can't be refund at any forms. Proceed to booking ?", "Information Center", a, MessageBoxIcon.Information);
            if (result3 == DialogResult.Yes)
            {

                increment++;
                increment_c++;
                inc_++;
                if (Pass_Substraction > Tot_Pricing)
                {
                    Substraction_ = Tot_Pricing;
                    Pass_Substraction = Pass_Substraction - Tot_Pricing;
                    MCash f2 = new MCash(Substraction_, Pass_Substraction, Phone_Login);
                    label20.Text = Convert.ToString(Pass_Substraction);
                    File.WriteAllText(Phone_Login + "_cash.txt", String.Empty);
                    File.WriteAllText(Phone_Login + "_counter.txt", String.Empty);

                    FileStream fs = new FileStream(Phone_Login + "_cash.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter sr = new StreamWriter(fs);
                    sr.WriteLine(Pass_Substraction);
                    sr.Flush();
                    sr.Close();
                    fs.Close();

                    var unique = Guid.NewGuid().ToString();
                    Code = unique.Split(Deli_Strip);
                    Coded = Code[0].ToUpper();
                    Valid2_Now = date.ToString("HH:mm:ss ( " + DateTime.Today.ToShortDateString() + " ) ");
                    date2 = date2.AddDays(7);
                    Valid2_End = date.ToString("HH:mm:ss ( " + DateTime.Today.AddDays(7).ToShortDateString() + " ) ");

                    Pop_up f4 = new Pop_up(Coded, Valid2_Now, Valid2_End);
                    f4.Show();
                    FileStream fs5 = new FileStream(Phone_Login + "_booking.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter sr5 = new StreamWriter(fs5);
                    sr5.WriteLine(increment + "#" + Coded + "#" + Valid2_Now + "#" + Valid2_End + "#" + TB_Origin_Check.Text + "#" + TB_Destination_Check.Text + "#" + TB_Passenger_Check.Text + "#" + TB_Time_Check.Text + "#" + TB_Distances_Check.Text + "#" + TB_TotPrice_Check.Text + "#" + TB_Price_Check.Text + "#");
                    sr5.Flush();
                    sr5.Close();
                    fs5.Close();

                    FileStream fs6 = new FileStream(Phone_Login + "_counter.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter sr6 = new StreamWriter(fs6);
                    sr6.WriteLine(inc_);
                    sr6.Flush();
                    sr6.Close();
                    fs6.Close();

                    File.WriteAllText("global_counter.txt", String.Empty);
                    FileStream fs9 = new FileStream("global_counter.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter sr9 = new StreamWriter(fs9);
                    sr9.WriteLine(increment_c);
                    sr9.Flush();
                    sr9.Close();
                    fs9.Close();

                    File.WriteAllText(Phone_Login + "_checkHistory.txt", String.Empty);
                    FileStream fp1 = new FileStream(Phone_Login + "_checkHistory.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter sp1 = new StreamWriter(fp1);
                    sp1.WriteLine("1");
                    sp1.Flush();
                    sp1.Close();
                    fp1.Close();

                    MessageBoxButtons b = MessageBoxButtons.OK;
                    DialogResult result4 = MessageBox.Show("Booking process have been successfully made. See the booking details in the Histroy for more information about the booked ticket", "Information Center", a, MessageBoxIcon.Information);
                }
            }
        }

        Stopwatch watch = new Stopwatch();
        DateTime date = DateTime.Now;
        DateTime date2 = DateTime.Now; //dt = dt.AddDays(6);

        private void TB_Adult_Pass_KeyPress(object sender, KeyPressEventArgs e)
        {
            //Restrict the user input to only allow input at numeric characters ( 0 - 9 )
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void BT_Check_Click(object sender, EventArgs e)
        {
            //Checking up validations
            Validating_();
            if (Checking_ == true)
            {
                Valid_Now = date.ToString("dd/MM/yy");
                date2 = date2.AddDays(7);
                Valid_End = date2.ToString("dd/MM/yy");
                Checking_Data();
                TB_Passenger_Check.Text = Adult_ + " " + Trip_Stats;
                TB_Origin_Check.Text = Selected_Origin;
                TB_Destination_Check.Text = Selected_Destination;
                TB_Distances_Check.Text = Measuring + " km";
                TB_Price_Check.Text = "Rp " + Pricing + ".000,00";
                TB_Time_Check.Text = Timing + " minutes";
                TB_TotPrice_Check.Text = "Rp " + Tot_Pricing + ".000,00";
                TB_Validation_Check.Text = DateTime.Today.ToShortDateString() + "~" + DateTime.Today.AddDays(7).ToShortDateString();
                TB_Substract_Check.Text = "Rp " + Tot_Pricing + ".000,00";
                TB_Cash_Check.Text = "Rp " + Tot_Pricing + ".000,00";
                if (Pass_Substraction > Tot_Pricing)
                {
                    TB_Error_8.Visible = false;
                    errorProvider6.Clear();
                }
                else
                {
                    TB_Error_8.Visible = true;
                    errorProvider6.SetError(TB_Error_8, " The M-Cash is Not Enough to Make The Payment. Please Top - Up");
                    errorProvider6.BlinkStyle = ErrorBlinkStyle.NeverBlink;
                }
                BT_Book.Enabled = true;
                BT_Book.BackColor = Color.Honeydew;
            }
        }

        //Setting up validations
        public void Validating_()
        {
            //Checking whether the Adult Passenger are valued 0
            if (TB_Adult_Pass.Text == "0")
            {
                TB_Adult_Pass.Focus();
                TB_Adult_Pass.Text = "1";
                TB_Error.Visible = true;
                errorProvider1.SetError(TB_Error, " A Minimum of Adult Passenger is Required");
                watch.Start();
                Time_Start = true;
                errorProvider1.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                Adult_ = Convert.ToInt16(TB_Adult_Pass.Text);
                Faint_ = Convert.ToInt16(TB_Faint_Pass.Text);
                Count_Checking_++;
            }

            //Checking whether the destination station are not selected for once
            if (CB_Destination_List.SelectedIndex > -1)
            {
                Count_Checking_++;
                TB_Error_2.Visible = false;
                if (Selected_Origin != Selected_Destination)
                {
                    //Count_Checking_++;
                }
            }
            else
            {
                TB_Error_2.Visible = true;
                errorProvider2.SetError(TB_Error_2, " You Haven't Select The Destination Station Yet");
                errorProvider2.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }

            //Checking whether the origin station are not selected for once
            if (CB_Origin_List.SelectedIndex > -1)
            {
                Count_Checking_++;
                TB_Error_3.Visible = false;
            }
            else
            {
                TB_Error_3.Visible = true;
                errorProvider3.SetError(TB_Error_3, " You Haven't Select The Origin Station Yet");
                errorProvider3.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }

            if (Selected_Destination != Selected_Origin)
            {
                Destination_Issue = true;
                Origin_Issue = true;
            }

            //Evaluate all the correct validations
            if (Count_Checking_ == 3 && Destination_Issue == true && Origin_Issue == true)
            {
                Checking_ = true;
                Count_Checking_ = 0;
            }
            else
            {
                Count_Checking_ = 0;
                //Destination_Issue = false;
                //Origin_Issue = false;
                Checking_ = false;
            }
        }

        public void Checking_Data()
        {
            //Linear Search Algorithm
            Selected_Origin = CB_Origin_List.Items[CB_Origin_List.SelectedIndex].ToString();
            Selected_Destination = CB_Destination_List.Items[CB_Destination_List.SelectedIndex].ToString();
            for (int i = 0; i < 13; i++)
            {
                if (Selected_Origin == Origin_ArrayList[i])
                {
                    //label16.Text = Convert.ToString(i);
                    Temp_A_Origin = i;
                }
                if (Selected_Destination == Destination_ArrayList[i])
                {
                    label16.Text = Convert.ToString(i);
                    Temp_A_Destination = i;
                }
            }
            if (Origin_Price[Temp_A_Origin] > Destination_Price[Temp_A_Destination])
            {
                if (increment_c == 10)
                {
                    DialogResult Nahh;
                    Nahh = MessageBox.Show("Congratulations, you just got 50% Discount for being the 8th Customer that booked on MRT E-TICKETING :3", "Information Center", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    if (Nahh == DialogResult.OK)
                    {
                        Pricing = (Origin_Price[Temp_A_Origin] - Destination_Price[Temp_A_Destination]) / 2;
                    }
                }
                else
                {
                    Pricing = Origin_Price[Temp_A_Origin] - Destination_Price[Temp_A_Destination];
                }
                Measuring = Origin_KM[Temp_A_Origin] - Destination_KM[Temp_A_Destination];            
            }
            else
            {
                if (increment_c == 10)
                {
                    DialogResult Nahh;
                    Nahh = MessageBox.Show("Congratulations, you just got 50% Discount for being the 8th Customer that booked on MRT E-TICKETING :3", "Information Center", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    if (Nahh == DialogResult.OK)
                    {
                        Pricing = (Destination_Price[Temp_A_Destination] - Origin_Price[Temp_A_Origin]) / 2;
                    }
                }
                else
                {
                    Pricing = Destination_Price[Temp_A_Destination] - Origin_Price[Temp_A_Origin];
                }
                Measuring = Destination_KM[Temp_A_Destination] - Origin_KM[Temp_A_Origin];
            }
            if (Measuring < 0)
            {
                Measuring = Measuring * -1;
            }
            if (RB_Single.Checked == true)
            {
                Adult_ = 1;
                Trip_Stats = "(one) Single Trip";
            }
            else
            {
                Adult_ = 2;
                Trip_Stats = "(two) Multi Trip";
            }
            Tot_Pricing = Pricing * Adult_;        
            Timing = Measuring * 3;
            label18.Text = Convert.ToString(Pricing);
            label19.Text = Convert.ToString(Measuring);
        }
        int temp_list;
        private void CB_Origin_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Clearing the error info, and enabling destination combo box
            if (CB_Origin_List.SelectedIndex > -1)
            {
                CB_Destination_List.Enabled = true;
                errorProvider3.Clear();
                Selected_Origin = CB_Origin_List.Items[CB_Origin_List.SelectedIndex].ToString();
                if (Selected_Origin == Selected_Destination)
                {
                    TB_Error_5.Visible = true;
                    errorProvider5.SetError(TB_Error_5, " You Can't Select The Same Station for Twice");
                    errorProvider5.BlinkStyle = ErrorBlinkStyle.NeverBlink;
                    Origin_Issue = false;
                }
                else
                {
                    Origin_Issue = true;
                    TB_Error_5.Visible = false;
                    TB_Error_4.Visible = false;
                    errorProvider5.Clear();
                }
                //for (int i = 0; i < Destination_ArrayList.Length; i++)
                //{
                //    //if (Origin_ArrayList[i] == CB_Origin_List.Items[CB_Origin_List.SelectedIndex].ToString())
                //    //{
                //    //    temp_list = i;
                //    //}
                //    for (int j = 0; j < Destination_ArrayList.Length-1; j++)
                //    {
                //        if (Destination_Price[j] > Destination_Price[j+1])
                //        {
                //            //temp = Nominal_Array[j + 1];
                //            //Nominal_Array[j + 1] = Nominal_Array[j];
                //            //Nominal_Array[j] = temp;

                //            int temp;
                //            string temp2;
                //            temp = Destination_Price[j+1];
                //            temp2 = Destination_ArrayList[j + 1];
                //            Destination_Price[j+1] = Destination_Price[j];
                //            Destination_ArrayList[j + 1] = Destination_ArrayList[j];
                //            Destination_Price[j] = temp;
                //            Destination_ArrayList[j] = temp2;
                //        }
                //    }
                //}
                //for (int j = 0; j < Destination_ArrayList.Length; j++)
                //{
                //    CB_Destination_List.Items.Add(Destination_ArrayList[j]);
                //}
            }
        }

        private void CB_Destination_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Clearing the error info
            if (CB_Destination_List.SelectedIndex > -1)
            {
                Pass_Origin = true;
                errorProvider2.Clear();
                Selected_Destination = CB_Destination_List.Items[CB_Destination_List.SelectedIndex].ToString();
                if (Selected_Origin == Selected_Destination)
                {
                    TB_Error_4.Visible = true;
                    errorProvider4.SetError(TB_Error_4, " You Can't Select The Same Station for Twice");
                    errorProvider4.BlinkStyle = ErrorBlinkStyle.NeverBlink;
                    Destination_Issue = false;
                }
                else
                {
                    Destination_Issue = true;
                    TB_Error_4.Visible = false;
                    TB_Error_5.Visible = false;
                    errorProvider4.Clear();
                }
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (Time_Start)
            {
                Time_Counter++;
                if (Time_Counter == 4)
                {
                    errorProvider1.Clear();
                    TB_Error.Visible = false;
                    watch.Stop();
                    Time_Start = false;
                    Time_Counter = 0;
                }
            }
            Time_Info++;
            if (Time_Info < 6)
            {
                TB_Info.Text = "This E-TICKETING doesn't bind with the operational schedules of MRT which are more versetile and flexible for the user";
            }
            if (Time_Info > 6 )
            {
                TB_Info.Text = "MRT are operate begin at ( 05:30 AM -- 10:30 PM ) with an atleast approximately of 10 minutes headway from the stations";
            }
            if (Time_Info > 13)
            {
                TB_Info.Text = "The booking code won't be valid when it reach 7 days long after the booking process that have been successfully made";
            }
            if (Time_Info > 20)
            {
                Time_Info = 0;
            }
        }

        private void TB_Faint_Pass_KeyPress(object sender, KeyPressEventArgs e)
        {
            //Restrict the user input to only allow input at numeric characters ( 0 - 9 )
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }
    }
}
