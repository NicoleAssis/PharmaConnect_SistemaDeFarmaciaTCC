﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TESTE_GUNA.projeto.dao;
using TESTE_GUNA.projeto.window;
using TESTE_GUNA.projeto.model;

namespace TESTE_GUNA.projeto.view
{
    public partial class FrmPerfil : Form
    {
        public FrmPerfil()
        {
            InitializeComponent();
        }

        #region buttonsDoMenu

        private void btnHome_Click(object sender, EventArgs e)
        {
            FrmMenu telaMenu = new FrmMenu();
            this.Close();
            telaMenu.Show();






        }

        private void btnDepartamentos_Click(object sender, EventArgs e)
        {
            FrmDepartamentos telaDepartamentos = new FrmDepartamentos();
            this.Close();
            telaDepartamentos.Show();
        }

        private void btnCompras_Click(object sender, EventArgs e)
        {
            FrmCompras telaCompras = new FrmCompras();
            this.Close();
            telaCompras.Show();
        }

        #endregion


        private void btnX_Click(object sender, EventArgs e)
        {
            //button fechar o programa (X)
            Environment.Exit(0);
        }

        private void lblDepartamento_Click(object sender, EventArgs e)
        {

        }

        private void btnAlterarSenha_Click(object sender, EventArgs e)
        {
            FrmPerfilAlterarSenha telaAlterarSenha = new FrmPerfilAlterarSenha();
            telaAlterarSenha.ShowDialog();
        }


        //se o button alterar informacoes for clicado ou nao
        public bool click = false;
        private void btnSalvarAlteracoes_Click(object sender, EventArgs e)
        {
            //caso o button foi clicado pela primeira vez
            if (click == false)
            { 
                //deixar todos os txt podendo ser alterados
                txtBairro.ReadOnly = false;
                txtCEP.ReadOnly = false;
                txtBase2.ReadOnly = false;
                txtCidade.ReadOnly = false;
                txtComplemento.ReadOnly = false;
                txtEmail.ReadOnly = false;
                txtEndereco.ReadOnly = false;
                txtEstado.ReadOnly = false;
                txtNome.ReadOnly = false;
                txtNum.ReadOnly = false;

                btnSalvarAlteracoes.Text = "SALVAR";
                btnSalvarAlteracoes.FillColor = System.Drawing.Color.FromArgb(65, 25, 227);
                click = true;
            }
            //caso o button foi clicado pela segunda vez
            else if (click == true)
            {
                //insert
                TelaMessageBox messageBoxTela = new TelaMessageBox();
                messageBoxTela.Mensagem("ALTERADO COM SUCESSO!");
                messageBoxTela.ShowDialog();
                
                //deixar todos os txt podendo ser alterados
                txtBairro.ReadOnly = true;
                txtCEP.ReadOnly = true;
                txtBase2.ReadOnly = true;
                txtCidade.ReadOnly = true;
                txtComplemento.ReadOnly = true;
                txtEmail.ReadOnly = true;
                txtEndereco.ReadOnly = true;
                txtEstado.ReadOnly = true;
                txtNome.ReadOnly = true;
                txtNum.ReadOnly = true;

                btnSalvarAlteracoes.Text = "ALTERAR INFORMAÇÕES";
                btnSalvarAlteracoes.FillColor = System.Drawing.Color.FromArgb(81, 117, 237);
                click = false;
            }
           

        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            //volta para a tela e login
            TelaLogin telaLogin = new TelaLogin();
            this.Close();
            telaLogin.Show();
        }

        private void txtCPF_Click(object sender, EventArgs e)
        {

        }

        private void txtCPF_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }

        private void txtCPF_MouseClick(object sender, MouseEventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void panel8_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnPerfil_Click(object sender, EventArgs e)
        {
            Cliente dao = new Cliente();
            
            DataTable tabelaCliente = new DataTable();
           
            
      
        }

        private void Form_Load(object sender, EventArgs e)
        {
            ClienteDAO dao = new ClienteDAO();

            

        }

        private void txtNome_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
