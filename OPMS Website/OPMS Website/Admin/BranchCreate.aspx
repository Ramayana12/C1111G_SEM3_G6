<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="BranchCreate.aspx.cs" Inherits="OPMS_Website.Admin.BranchCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li class="current"><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="BranchCreate.aspx" class="addorder">New Branch</a></li>
            <li><a href="BranchManagement.aspx" class="folder_table">List Branches</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Add New Branch</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend" style="width: 85px">BRANCH INFORMATION</legend>&nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblBranchName" runat="server" Text="Branch Name :"></asp:Label>
                <asp:TextBox ID="txtBranchName" runat="server" Width="213px" AutoPostBack="True" OnTextChanged="txtBranchName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBranchName" runat="server" ControlToValidate="txtBranchName"
                    ErrorMessage="Branch Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckBranchName" runat="server" ForeColor="Red"></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblBranchEmail"
                    runat="server" Text="Branch Email :"></asp:Label>
                <asp:TextBox ID="txtBranchEmail" runat="server" Width="213px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBranchEmail" runat="server" ControlToValidate="txtBranchEmail"
                    ErrorMessage=" Branch Email is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBranchEmail"
                    ErrorMessage="Email Invalid!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">(*)</asp:RegularExpressionValidator>
                &nbsp; 
                &nbsp;<br />
                &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="lblPhone" runat="server" Text="Phone :"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" Width="213px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone Number is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone Invalid !" ValidationExpression="^0\d{9,10}$" ForeColor="Red">(*)</asp:RegularExpressionValidator>
                &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="_lblAddress" runat="server" Text="Address :"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Height="50px" Width="360px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Address is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                &nbsp;
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblDescription" runat="server" Text="Description :"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Height="49px" Width="360px" TextMode="MultiLine"></asp:TextBox>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblStatusAddNewBranch" runat="server" ForeColor="Red"></asp:Label><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btnCreateBranch" runat="server" Text="Create Branch" OnClick="btnCreateBranch_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/BranchManagement.aspx" CausesValidation="False" />
                <br />
                <br />
            </fieldset>
            <br />
        </div>
    </div>
</asp:Content>
