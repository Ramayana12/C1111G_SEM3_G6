<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="EmployeeUpdateProfile.aspx.cs" Inherits="OPMS_Website.Employee.EmployeeUpdateProfile" %>

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
        <h3>Update Profile</h3>
        <div class="form">
            <fieldset id="personal" class="form">
                <legend class="legend" style="width: 85px">INFORMATION</legend>

                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Full Name :"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                    ErrorMessage="First Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Image ID="imgPicture" runat="server" Height="140px" Width="140px" /><br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label6" runat="server" Text="Picture :"></asp:Label>&nbsp;<asp:FileUpload
                    ID="fuPicture" runat="server" Width="214px" /><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;<asp:Label ID="Label3" runat="server" Text="Birth Date :"></asp:Label>
                <asp:TextBox ID="txtBirthDate" runat="server" Width="210px" TextMode="DateTime"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBirthDate" runat="server" ControlToValidate="txtBirthDate"
                    ErrorMessage="Birth Date is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:Label ID="Label8" runat="server" Text="[mm / dd / yyyy]"></asp:Label>
                <asp:Label ID="lblCheckBirthDate" runat="server" ForeColor="Red"></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label4"
                    runat="server" Text="Phone Number :"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone Number is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone Invalid !" ValidationExpression="^0\d{9,10}$" ForeColor="Red">(*)</asp:RegularExpressionValidator>
                <br />
                &nbsp; &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label11" runat="server" Text="Email :"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email Invalid !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">(*)</asp:RegularExpressionValidator>
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp;<asp:Label ID="Label12" runat="server" Text="Address :"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label5" runat="server" Text="Description :"></asp:Label>&nbsp;<asp:TextBox ID="txtDescription" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px"></asp:TextBox>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="lblStatusUpdate" runat="server" ForeColor="Red"></asp:Label><br />
                &nbsp; &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;
                <asp:Button ID="btnApplyChange"
                    runat="server" Text="Apply Change"
                    OnClick="btnApplyChange_Click"
                    ToolTip="Apply Change Information" />&nbsp;
                <asp:Button ID="btnClose" runat="server" PostBackUrl="~/Employee/HomeEmployee.aspx"
                    Text="Close" CausesValidation="False" ToolTip="Close form" /><br />
                <br />
                <br />
                <br />

            </fieldset>
            &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;
        </div>
    </div>
</asp:Content>
