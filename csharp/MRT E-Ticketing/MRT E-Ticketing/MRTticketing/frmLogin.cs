using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.IO;

namespace MRTticketing
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
            TB_Nama_Reg.MaxLength = 17;
            TB_Identitiy_Reg.MaxLength = 17;
            TB_Phone_Reg.MaxLength = 14;
            TB_Password_Reg.MaxLength = 15;
            TB_Password_LogIn.MaxLength = 15;
            TB_Phone_LogIn.MaxLength = 14;
            CB_Identity_Reg.Text = "KTP";
            TB_Phone_LogIn.Focus();
        }
        bool checking_all;
        int checking_birth, checking_province, passed_check;
        string Read_All, Pass_Phone, Pass_Password, Confirm_Phone, Confirm_Password, Real_Ph, Real_Pass;
        string Phone_Temp;
        string[] Read_All_Arr;
        char[] Delimiter_Line = { '\n' };
        int a_, b_;
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            //
        }

        private void TB_Phone_LogIn_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void TB_Phone_Reg_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
            if (TB_Phone_Reg.Text.Length > 9)
            {
                errorProvider3.Clear();
                //passed_check++;
            }
        }

        private void TB_Nama_Reg_KeyPress(object sender, KeyPressEventArgs e)
        {
            var regex = new Regex(@"[^a-zA-Z\s\b]");
            if (regex.IsMatch(e.KeyChar.ToString()))
            {
                e.Handled = true;
            }
            if (TB_Nama_Reg.Text.Length > 4)
            {
                errorProvider1.Clear();
                //passed_check++;
            }
        }

        private void TB_Identitiy_Reg_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
            if (TB_Identitiy_Reg.Text.Length > 9)
            {
                errorProvider2.Clear();
                //passed_check++;
            }
        }

        private void TB_Password_LogIn_KeyPress(object sender, KeyPressEventArgs e)
        {
            TB_Password_Reg.CharacterCasing = CharacterCasing.Lower;
            e.Handled = (e.KeyChar == (char)Keys.Space);
            var regex = new Regex(@"[^a-zA-Z0-9\s\b]");
            if (regex.IsMatch(e.KeyChar.ToString()))
            {
                e.Handled = true;
            }
        }

        private void TB_Password_Reg_KeyPress(object sender, KeyPressEventArgs e)
        {
            var regex = new Regex(@"[^a-zA-Z0-9\s\b]");
            TB_Password_Reg.CharacterCasing = CharacterCasing.Lower;
            e.Handled = (e.KeyChar == (char)Keys.Space);
            if (regex.IsMatch(e.KeyChar.ToString()))
            {
                e.Handled = true;
            }
            if (TB_Password_Reg.Text.Length > 6)
            {
                errorProvider6.Clear();
                //passed_check++;
            }
        }
        public void validation()
        {
            if (TB_Nama_Reg.Text.Length < 5 || TB_Nama_Reg.Text.Length == 0)
            {
                errorProvider1.SetError(PB_Error1, " Limitation of Character are 5 to 17");
                errorProvider1.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider1.Clear();
                passed_check++;
            }
            if (TB_Identitiy_Reg.Text.Length < 10 || TB_Identitiy_Reg.Text.Length == 0)
            {
                errorProvider2.SetError(PB_Error2, " Limitation of Character are 10 to 17");
                errorProvider2.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider2.Clear();
                passed_check++;
            }
            if (TB_Phone_Reg.Text.Length < 10 || TB_Phone_Reg.Text.Length == 0)
            {
                errorProvider3.SetError(PB_Error3, " Limitation of Character are 10 to 14");
                errorProvider3.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider3.Clear();
                passed_check++;
            }
            if (checking_birth < 3)
            {
                errorProvider4.SetError(PB_Error4, " You can't Leave The Birth Details Blank");
                errorProvider4.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider4.Clear();
                passed_check++;
            }
            if (checking_province < 1)
            {
                errorProvider5.SetError(PB_Error5, " You can't Leave The Province Detail Blank");
                errorProvider5.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider5.Clear();
                passed_check++;
            }
            if (TB_Password_Reg.Text.Length < 7 || TB_Phone_Reg.Text.Length == 0)
            {
                errorProvider6.SetError(PB_Error6, " Limitation of Character are 8 to 15");
                errorProvider6.BlinkStyle = ErrorBlinkStyle.NeverBlink;
            }
            else
            {
                errorProvider6.Clear();
                passed_check++;
            }
            if (passed_check >= 6)
            {
                checking_all = true;
            }
        }

        private void TB_Password_Reg_TextChanged(object sender, EventArgs e)
        {
            //
        }

        private void CB_DD_Reg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CB_DD_Reg.SelectedIndex > -1)
            {
                checking_birth++;
            }
        }

        private void CB_MM_Reg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CB_MM_Reg.SelectedIndex > -1)
            {
                checking_birth++;
            }
        }

        private void TB_Phone_LogIn_TextChanged(object sender, EventArgs e)
        {

        }

        private void CB_Province_Reg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CB_Province_Reg.SelectedIndex > -1)
            {
                checking_province++;
            }

        }

        private void BT_LogIn_Click(object sender, EventArgs e)
        {
            Real_Ph = TB_Phone_LogIn.Text;
            Real_Pass = TB_Password_LogIn.Text;
            Phone_Temp = Real_Ph; 
            try
            {
                FileStream fs = new FileStream(TB_Phone_LogIn.Text + "_profile.txt", FileMode.Open, FileAccess.Read);
                StreamReader sr = new StreamReader(fs);
                Read_All = sr.ReadToEnd();
                Read_All_Arr = Read_All.Split(Delimiter_Line);
                sr.Close();
                fs.Close();
                Pass_Phone = Read_All_Arr[3];
                Pass_Password = Read_All_Arr[8];
                Confirm_Password = TB_Password_LogIn.Text;
                Confirm_Phone = TB_Phone_LogIn.Text;
                //label12.Text = Pass_Phone;
                //label13.Text = Pass_Password;
                //TB_Phone_LogIn.Text = Pass_Phone;
                //TB_Password_LogIn.Text = Pass_Password;
                //MessageBox.Show("sek", "sek", MessageBoxButtons.OK, MessageBoxIcon.Hand);
                if ((TB_Phone_LogIn.Text.ToLower().Trim() == Pass_Phone.ToString().ToLower().Trim()) && (TB_Password_LogIn.Text.ToLower().Trim() == Pass_Password.ToString().ToLower().Trim()))
                {
                    MessageBoxButtons a = MessageBoxButtons.OK;
                    DialogResult result3 = MessageBox.Show("Logging in account successfully !", "Information Center", a, MessageBoxIcon.Information);
                    if (result3 == DialogResult.OK)
                    {
                        Form1 f1_ = new Form1(TB_Phone_LogIn.Text.ToLower().Trim());
                        MCash f2_ = new MCash(a_, b_, TB_Phone_LogIn.Text.ToLower().Trim());
                        History f3_ = new History(TB_Phone_LogIn.Text.ToLower().Trim());
                        f1_.Show();
                        this.Hide();
                    }
                }
                else
                {
                    MessageBoxButtons a = MessageBoxButtons.OK;
                    DialogResult result4 = MessageBox.Show("The account is found, but the password is incorrect. Please fill your password properly", "Information Center", a, MessageBoxIcon.Information);
                    if (result4 == DialogResult.OK)
                    {
                        TB_Phone_LogIn.Clear();
                        TB_Password_LogIn.Clear();
                        TB_Phone_LogIn.Text = Phone_Temp;
                    }
                }
            }
            catch (FileNotFoundException ex)
            {
                MessageBoxButtons a = MessageBoxButtons.OK;
                DialogResult result5 = MessageBox.Show("Account either not found or not registered yet. Please sign up your account first in order to use the application", "Information Center", a, MessageBoxIcon.Information);
                //label12.Text = ex.ToString();
            }
        }

        private void CB_YY_Reg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CB_YY_Reg.SelectedIndex > -1)
            {
                checking_birth++;
            }
        }
        DialogResult Yass;
        DialogResult Nahh;
        private void BT_SignUp_Click(object sender, EventArgs e)
        {
            validation();
            if (checking_all)
            {
                MessageBoxButtons b = MessageBoxButtons.YesNo;
                DialogResult result2 = MessageBox.Show("Have you fulfill the requirements properly ? It cannot be changed for futher operation. Proceed to register your Account ?", "Information Center", b, MessageBoxIcon.Question);
                if (result2 == DialogResult.Yes)
                {
                    try
                    {
                        string Check;
                        FileStream fs7 = new FileStream(TB_Phone_Reg.Text + "_profile.txt", FileMode.Open, FileAccess.Read);
                        StreamReader sr7 = new StreamReader(fs7);
                        Check = sr7.ReadToEnd();
                        sr7.Close();
                        fs7.Close();
                        MessageBoxButtons c = MessageBoxButtons.YesNo;
                        DialogResult result3 = MessageBox.Show("There is already an registered account with this number. Signing up may rewrite the account details. Proceed to register your Account ?", "Information Center", c, MessageBoxIcon.Information);
                        if (result3 == DialogResult.Yes)
                        {
                            Yass = MessageBox.Show("Creating account successfully !", "Information Center", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            if (Yass == DialogResult.OK)
                            {
                                File.WriteAllText(TB_Phone_Reg.Text + "_profile.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_cash.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_booking.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_topup.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_counter.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_checkHistory.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_checkTopup.txt", String.Empty);
                                File.WriteAllText(TB_Phone_Reg.Text + "_counterTopup.txt", String.Empty);

                                FileStream fs = new FileStream(TB_Phone_Reg.Text + "_profile.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sw = new StreamWriter(fs);
                                sw.WriteLine(TB_Nama_Reg.Text);
                                sw.WriteLine(CB_Identity_Reg.Items[CB_Identity_Reg.SelectedIndex].ToString());
                                sw.WriteLine(TB_Identitiy_Reg.Text);
                                sw.WriteLine(TB_Phone_Reg.Text);
                                sw.WriteLine(CB_DD_Reg.Items[CB_DD_Reg.SelectedIndex].ToString());
                                sw.WriteLine(CB_MM_Reg.Items[CB_MM_Reg.SelectedIndex].ToString());
                                sw.WriteLine(CB_YY_Reg.Items[CB_YY_Reg.SelectedIndex].ToString());
                                sw.WriteLine(CB_Province_Reg.Items[CB_Province_Reg.SelectedIndex].ToString());
                                sw.WriteLine(TB_Password_Reg.Text);
                                sw.Flush();
                                sw.Close();
                                fs.Close();

                                FileStream fs23 = new FileStream(TB_Phone_Reg.Text + "_cash.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sw23 = new StreamWriter(fs23);
                                sw23.WriteLine("0");
                                sw23.Flush();
                                sw23.Close();
                                fs23.Close();

                                FileStream fs6 = new FileStream(TB_Phone_Reg.Text + "_counter.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sr6 = new StreamWriter(fs6);
                                sr6.WriteLine("0");
                                sr6.Flush();
                                sr6.Close();
                                fs6.Close();

                                FileStream fs9 = new FileStream(TB_Phone_Reg.Text + "_booking.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sr9 = new StreamWriter(fs9);
                                sr9.WriteLine("0");
                                sr9.Flush();
                                sr9.Close();
                                fs9.Close();

                                //FileStream f11 = new FileStream("global_counter.txt", FileMode.Append, FileAccess.Write);
                                //StreamWriter sr11 = new StreamWriter(f11);
                                //sr11.WriteLine("0");
                                //sr11.Flush();
                                //sr11.Close();
                                //f11.Close();

                                FileStream fp1 = new FileStream(TB_Phone_Reg.Text + "_checkHistory.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sp1 = new StreamWriter(fp1);
                                sp1.WriteLine("0");
                                sp1.Flush();
                                sp1.Close();
                                fp1.Close();

                                FileStream fp99 = new FileStream(TB_Phone_Reg.Text + "_checkTopup.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sp99 = new StreamWriter(fp99);
                                sp99.WriteLine("0");
                                sp99.Flush();
                                sp99.Close();
                                fp99.Close();

                                FileStream fs88 = new FileStream(TB_Phone_Reg.Text + "_counterTopup.txt", FileMode.Append, FileAccess.Write);
                                StreamWriter sr88 = new StreamWriter(fs88);
                                sr88.WriteLine("0");
                                sr88.Flush();
                                sr88.Close();
                                fs88.Close();

                                Form1 f1 = new Form1(TB_Phone_Reg.Text.ToLower().Trim());
                                MCash f2 = new MCash(a_, b_, TB_Phone_Reg.Text.ToLower().Trim());
                                History f3 = new History(TB_Phone_Reg.Text.ToLower().Trim());
                                f1.Show();
                                this.Hide();
                            }
                            if (result3 == DialogResult.No)
                            {

                            }
                        }
                    }
                    catch (FileNotFoundException ex)
                    {
                        Nahh = MessageBox.Show("Creating account successfully !", "Information Center", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        if (Nahh == DialogResult.OK)
                        {
                            //
                            FileStream fs = new FileStream(TB_Phone_Reg.Text + "_profile.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sw = new StreamWriter(fs);
                            sw.WriteLine(TB_Nama_Reg.Text);
                            sw.WriteLine(CB_Identity_Reg.Items[CB_Identity_Reg.SelectedIndex].ToString());
                            sw.WriteLine(TB_Identitiy_Reg.Text);
                            sw.WriteLine(TB_Phone_Reg.Text);
                            sw.WriteLine(CB_DD_Reg.Items[CB_DD_Reg.SelectedIndex].ToString());
                            sw.WriteLine(CB_MM_Reg.Items[CB_MM_Reg.SelectedIndex].ToString());
                            sw.WriteLine(CB_YY_Reg.Items[CB_YY_Reg.SelectedIndex].ToString());
                            sw.WriteLine(CB_Province_Reg.Items[CB_Province_Reg.SelectedIndex].ToString());
                            sw.WriteLine(TB_Password_Reg.Text);
                            sw.Flush();
                            sw.Close();
                            fs.Close();

                            FileStream fs2 = new FileStream(TB_Phone_Reg.Text + "_cash.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sw2 = new StreamWriter(fs2);
                            sw2.WriteLine("0");
                            sw2.Flush();
                            sw2.Close();
                            fs2.Close();

                            FileStream fs6 = new FileStream(TB_Phone_Reg.Text + "_counter.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sr6 = new StreamWriter(fs6);
                            sr6.WriteLine("0");
                            sr6.Flush();
                            sr6.Close();
                            fs6.Close();

                            FileStream fs9 = new FileStream(TB_Phone_Reg.Text + "_booking.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sr9 = new StreamWriter(fs9);
                            sr9.WriteLine("0");
                            sr9.Flush();
                            sr9.Close();
                            fs9.Close();

                            //FileStream fs11 = new FileStream("global_counter.txt", FileMode.Append, FileAccess.Write);
                            //StreamWriter sr11 = new StreamWriter(fs11);
                            //sr11.WriteLine("0");
                            //sr11.Flush();
                            //sr11.Close();
                            //fs11.Close();

                            FileStream fp1 = new FileStream(TB_Phone_Reg.Text + "_checkHistory.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sp1 = new StreamWriter(fp1);
                            sp1.WriteLine("0");
                            sp1.Flush();
                            sp1.Close();
                            fp1.Close();

                            FileStream fp99 = new FileStream(TB_Phone_Reg.Text + "_checkTopup.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sp99 = new StreamWriter(fp99);
                            sp99.WriteLine("0");
                            sp99.Flush();
                            sp99.Close();
                            fp99.Close();

                            FileStream fs88 = new FileStream(TB_Phone_Reg.Text + "_counterTopup.txt", FileMode.Append, FileAccess.Write);
                            StreamWriter sr88 = new StreamWriter(fs88);
                            sr88.WriteLine("0");
                            sr88.Flush();
                            sr88.Close();
                            fs88.Close();

                            Form1 f11 = new Form1(TB_Phone_Reg.Text.ToLower().Trim());
                            MCash f22 = new MCash(a_, b_, TB_Phone_Reg.Text.ToLower().Trim());
                            History f33 = new History(TB_Phone_Reg.Text.ToLower().Trim());
                            f11.Show();
                            this.Hide();
                        }
                    }
                }
            }
            else
            {
                passed_check = 0;
            }
        }
    }
}
