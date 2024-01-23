namespace MonthNamesGUI
{
    partial class MonthConversion
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtMonthInt = new System.Windows.Forms.TextBox();
            this.btnMonth = new System.Windows.Forms.Button();
            this.txtMonthStr = new System.Windows.Forms.TextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Enter Month Integer";
            // 
            // txtMonthInt
            // 
            this.txtMonthInt.Location = new System.Drawing.Point(128, 23);
            this.txtMonthInt.Name = "txtMonthInt";
            this.txtMonthInt.Size = new System.Drawing.Size(50, 20);
            this.txtMonthInt.TabIndex = 1;
            // 
            // btnMonth
            // 
            this.btnMonth.Location = new System.Drawing.Point(16, 58);
            this.btnMonth.Name = "btnMonth";
            this.btnMonth.Size = new System.Drawing.Size(85, 48);
            this.btnMonth.TabIndex = 2;
            this.btnMonth.Text = "Convert to Month";
            this.btnMonth.UseVisualStyleBackColor = true;
            this.btnMonth.Click += new System.EventHandler(this.btnMonth_Click);
            // 
            // txtMonthStr
            // 
            this.txtMonthStr.Location = new System.Drawing.Point(128, 73);
            this.txtMonthStr.Name = "txtMonthStr";
            this.txtMonthStr.Size = new System.Drawing.Size(124, 20);
            this.txtMonthStr.TabIndex = 3;
            this.txtMonthStr.TabStop = false;
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(16, 136);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(68, 24);
            this.btnReset.TabIndex = 4;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // MonthConversion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.txtMonthStr);
            this.Controls.Add(this.btnMonth);
            this.Controls.Add(this.txtMonthInt);
            this.Controls.Add(this.label1);
            this.Name = "MonthConversion";
            this.Text = "Month Converter Application";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMonthInt;
        private System.Windows.Forms.Button btnMonth;
        private System.Windows.Forms.TextBox txtMonthStr;
        private System.Windows.Forms.Button btnReset;
    }
}

