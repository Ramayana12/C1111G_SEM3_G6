<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="ServiceUpdate.aspx.cs" Inherits="OPMS_Website.Admin.ServiceUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">EMPLOYEE</a></li>
            <li class="current"><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="ServiceManagement.aspx" class="service">Services</a></li>
            <li><a href="DistanceManagement.aspx" class="distance">Distances</a></li>
            <li><a href="WeightManagement.aspx" class="cart">Weights</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Update Service</h3>
        <div class="form">
            <fieldset id="personal" class="form">
                <legend class="legend" style="width: 120px">SERVIVE &nbsp;INFORMATION</legend>&nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Service Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="213px" AutoPostBack="True" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Service Name is not empty" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckExist" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;
            <asp:Label ID="Label2" runat="server" Text="Service charge:"></asp:Label>
                <asp:TextBox ID="txtCharge" runat="server" Width="213px" AutoPostBack="True" MaxLength="15" OnTextChanged="txtCharge_TextChanged" TextMode="Number" ToolTip="Charge"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator
                    ID="rfvCharge" runat="server" ControlToValidate="txtCharge" ErrorMessage="Service Charge  is not empty" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckFormat" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;&nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="Label4" runat="server" Text="Description:"></asp:Label><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:TextBox ID="txtDescription" runat="server" Height="77px" TextMode="MultiLine"
                Width="331px"></asp:TextBox>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Label ID="lblStatusCreate" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="#FF3300"></asp:Label><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Button ID="btnUpdate" runat="server" Text="Apply change" OnClick="btnUpdate_Click" />
                &nbsp;
            <asp:Button ID="btnClose" runat="server" Text="Close" PostBackUrl="~/Admin/ServiceManagement.aspx" CausesValidation="False" /><br />
                <br />
            </fieldset>
        </div>
    </div>
</asp:Content>
