using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MonthNamesGUI
{
    public partial class MonthConversion : Form
    {
        public enum Month
        {
            January = 1,
            February,
            March,
            April,
            May,
            June,
            July,
            August,
            September,
            October,
            November,
            December
        }
        public MonthConversion()
        {
            InitializeComponent();
        }

        private void btnMonth_Click(object sender, EventArgs e)
        {
            int monthInt;
            if (int.TryParse(txtMonthInt.Text, out monthInt))
            {
                Month month = (Month)monthInt;
                txtMonthStr.Text = month.ToString();
            }
            else
            {
                MessageBox.Show("Please enter a valid integer for the month.");
            }

        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            txtMonthInt.Clear();
            txtMonthStr.Clear();

            txtMonthInt.Focus();
        }
    }
}
