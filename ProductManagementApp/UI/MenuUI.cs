using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProductManagementApp.UI;

namespace ProductManagementApp
{
    public partial class MenuUI : Form
    {
        public MenuUI()
        {
            InitializeComponent();
        }

        private void addProductButton_Click(object sender, EventArgs e)
        {
            ProductEntryUI productEntryUi = new ProductEntryUI();
            productEntryUi.Show();
        }

        private void saleProductButton_Click(object sender, EventArgs e)
        {
            ProductSaleUI productSaleUi = new ProductSaleUI();
            productSaleUi.Show();
        }
    }
}
