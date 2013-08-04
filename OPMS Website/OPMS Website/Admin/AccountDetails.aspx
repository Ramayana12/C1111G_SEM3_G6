<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="OPMS_Website.Admin.Account_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li class="current"><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="AccountCreate.aspx" class="useradd">Add user</a></li>
            <li><a href="AccountManagement.aspx" class="search">Find user</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Account details</h3> 
        <div class="form">   
            <fieldset id="personal" class="form" style="text-align: left">
            <legend class="legend" style="width: 85px">EMPLOYEE INFORMATION</legend>&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" Text="Full Name :"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" Width="210px" Enabled="False"></asp:TextBox>
                <br />
                &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Image ID="imgPicture" runat="server" Height="140px" Width="140px" />
                &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label11" runat="server" Text="Birth Date :"></asp:Label>
                <asp:TextBox ID="txtBirthDate" runat="server" Width="210px" Enabled="False" TextMode="DateTime"></asp:TextBox>&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label12" runat="server" Text="Phone Number :"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" Width="210px" Enabled="False"></asp:TextBox>&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label
                    ID="Label13" runat="server" Text="Email :"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" Width="210px" Enabled="False"></asp:TextBox>&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label15" runat="server" Text="Address :"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Height="51px" TextMode="MultiLine" Width="301px" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;<br />              
                <br />
            </fieldset> &nbsp;<br />
            <fieldset id="Fieldset1" class="form" style="text-align: left">
            <legend class="legend" style="width: 85px">ACCOUNT INFORMATION</legend>&nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label4" runat="server" Text="User Name :"></asp:Label>
                &nbsp;<asp:TextBox ID="txtUserName" runat="server" Width="210px" Enabled="False"></asp:TextBox>
                &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                <asp:Label ID="Label6" runat="server" Text="Branch :"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlBranches" runat="server" Width="217px">
                </asp:DropDownList>&nbsp;<br /><br />                
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Role :"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlRole" runat="server" Width="217px">
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <asp:Label ID="Label7" runat="server" Text="Active :"></asp:Label>&nbsp;<asp:CheckBox
                    ID="cbActive" runat="server" /><br />
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label8" runat="server"
                    Text="Description :"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Height="61px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
            </fieldset> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblStatusUpdateAccount" runat="server" ForeColor="Red"></asp:Label></div> 
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnApplyChange" 
            runat="server" Text="Apply Change" 
            OnClick="btnApplyChange_Click"             
            ToolTip="Apply Change Information for account !" />&nbsp;
        <asp:Button ID="btnResetPassword" 
            ToolTip="Reset Password To Default " 
            runat="server" Text="Reset Password" 
            OnClick="btnResetPassword_Click"
            OnClientClick="return confirm('Are you sure you want to Reset Password for this Account ?')"/>&nbsp;
        <asp:Button ID="btnClose" ToolTip="Close form" runat="server" PostBackUrl="~/Admin/AccountManagement.aspx"
            Text="Close" CausesValidation="False" /><br />
        <br />
        <br />
    </div> 
</asp:Content>
