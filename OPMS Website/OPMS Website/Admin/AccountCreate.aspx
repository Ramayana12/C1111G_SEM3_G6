<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AccountCreate.aspx.cs" Inherits="OPMS_Website.Admin.AccountCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="frmHome.aspx">HOME</a></li>
            <li><a href="BranchesManagement.aspx">BRANCHES</a></li>
            <li  class="current"><a href="frmAccountsManagement.aspx">USERS</a></li>
            <li><a href="frmServicesManagement.aspx">MANAGEMENT</a></li>
            <li><a href="frmNewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="frmAddNewAccount.aspx" class="useradd">Add user</a></li>
            <li><a href="frmAccountsManagement.aspx" class="search">Find user</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Add New Account</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend" style="width: 85px">EMPLOYEE INFORMATION</legend>&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" Text="Full Name :"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName"
                    ErrorMessage="Full Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label6" runat="server" Text="Branch :"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlBranches" runat="server" Width="217px">
                </asp:DropDownList>&nbsp;<br />
                &nbsp;
            </fieldset>
            &nbsp;<br />
            <fieldset id="Fieldset1" class="form" style="text-align: left">
                <legend class="legend" style="width: 85px">ACCOUNT INFORMATION</legend>&nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label4" runat="server" Text="User Name :"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" Width="210px" AutoPostBack="True" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="User Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckUserNameExist" runat="server" ForeColor="Red"></asp:Label>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Role :"></asp:Label>&nbsp;
                <asp:DropDownList
                    ID="ddlRole" runat="server" Width="217px">
                    <asp:ListItem Text="------Select Role-------" Value=""></asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlRole"
                    ErrorMessage="Select Role for account!" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label8" runat="server"
                    Text="Description :"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Height="61px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                <br />
                <br />
            </fieldset>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblStatusAddNewAccount" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" ToolTip="Create new account !" Width="96px" />&nbsp;
        <asp:Button ID="btnClose" runat="server" PostBackUrl="~/Admin/frmAccountsManagement.aspx" Text="Close" CausesValidation="False" ToolTip="Close form " /><br />
        <br />
    </div>
</asp:Content>
