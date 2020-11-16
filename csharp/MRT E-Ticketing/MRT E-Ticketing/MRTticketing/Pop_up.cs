using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MRTticketing
{
    public partial class Pop_up : Form
    {
        public Pop_up(string Pass_Code, string Booking_Time, string Valid_Time)
        {
            InitializeComponent();
            TB_Unicode.Text = Pass_Code;
            TB_Validnow.Text = Booking_Time;
            TB_Validend.Text = Valid_Time;
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
