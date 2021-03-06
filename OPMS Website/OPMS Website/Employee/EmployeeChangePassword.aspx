﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="EmployeeChangePassword.aspx.cs" Inherits="OPMS_Website.Employee.EmployeeChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li class="current"><a href="HomeEmployee.aspx">HOME</a></li>
            <li><a href="OrderManagement.aspx">ORDERS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Change Password</h3>
        <div class="form">
            <fieldset id="personal" class="form">
                <legend class="legend" style="width: 120px">INPUT INFORMATION</legend>&nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" Enabled="False" Width="174px"></asp:TextBox>
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="Old Password:"></asp:Label>
                <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" Width="174px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword"
                    ErrorMessage="Old Password is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckOldPassword" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;<asp:Label ID="Label3" runat="server" Text="New Password:"></asp:Label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="174px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
                    ErrorMessage="New Password is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                &nbsp;<br />
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label4" runat="server" Text="Confirm New Password:"></asp:Label>
                <asp:TextBox ID="txtConfirmNewPassword" runat="server" TextMode="Password" Width="174px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmNewPassword"
                    ErrorMessage="Confirm New Password Empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                    ControlToValidate="txtConfirmNewPassword" ErrorMessage="Confirm Password Invalid !" ForeColor="Red">(*)</asp:CompareValidator>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp; &nbsp;
                <asp:Label ID="lblStatusChangePassword" runat="server" ForeColor="#0000C0"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                &nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnApplyChange" runat="server" Text="Apply Change" OnClick="btnApplyChange_Click" ToolTip="Apply Change New Password" />&nbsp;
                <asp:Button ID="btnClose" runat="server" CausesValidation="False" PostBackUrl="~/Employee/HomeEmployee.aspx" Text="Close" ToolTip="Close form" />
                <br />
                <br />
            </fieldset>
        </div>
    </div>
</asp:Content>
