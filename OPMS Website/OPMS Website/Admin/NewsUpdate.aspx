<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="NewsUpdate.aspx.cs" Inherits="OPMS_Website.Admin.NewsUpdate" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li class="current"><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="NewsManagement.aspx" class="newAdd">News</a></li>
            <li><a href="FeedBackManagement.aspx" class="feedback">Feeb Back</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Add New News</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left;">
                <legend class="legend" style="width: 117px">NEWS INFORMATION</legend>
                <br />
                &nbsp; &nbsp; &nbsp;&nbsp;
             <asp:Label ID="Label1" runat="server" Text="Title:"></asp:Label>
                <asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                    ErrorMessage="Title is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                <br />
                &nbsp;<asp:Label ID="Label5" runat="server" Text="Subject:"></asp:Label><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
             <asp:TextBox ID="txtSubject" runat="server" Height="64px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="Subject is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Content:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ftbBody"
                    ErrorMessage="Content is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <FTB:FreeTextBox ID="ftbBody" runat="server" GutterBackColor="Gainsboro" ButtonSet="OfficeXP">
                </FTB:FreeTextBox>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Active:"></asp:Label>
                <asp:CheckBox ID="cbActive" runat="server" /><br /><br />               
                &nbsp;&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             <asp:Label ID="lblReport" runat="server" Text=""></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="86px" />&nbsp;<asp:Button ID="btnClose"
                    runat="server" Text="Close" PostBackUrl="~/Admin/NewsManagement.aspx" CausesValidation="False" />
                <br />
            </fieldset>
        </div>
    </div>
</asp:Content>
